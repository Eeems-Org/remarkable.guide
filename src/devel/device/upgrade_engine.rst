===============
System Upgrades
===============

.. raw:: html

    <div class="warning">
        ⚠️ FIXME. ⚠️

This page is just a stub that needs to be completed. You can `open a PR on the repo <https://github.com/Eeems-Org/remarkable.guide>`_ to add more content to the page.

.. raw:: html

    </div>

Update Systemd Service
======================

``update-engine.service``

DBus Interface
--------------

.. code-block:: xml

  <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
    "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
  <busconfig>
    <policy user="root">
      <allow own="no.remarkable.update1" />
      <allow send_destination="no.remarkable.update1" />
    </policy>
    <policy user="core">
      <!-- introspection is denied -->
      <deny send_destination="no.remarkable.update1"
            send_interface="org.freedesktop.DBus.Introspectable" />
      <!-- properties denied -->
      <deny send_destination="no.remarkable.update1"
            send_interface="org.freedesktop.DBus.Properties" />
      <!-- allow explicit methods -->
      <allow send_destination="no.remarkable.update1"
             send_interface="no.remarkable.update1.Manager"
             send_member="AttemptUpdate"/>
      <allow send_destination="no.remarkable.update1"
             send_interface="no.remarkable.update1.Manager"
             send_member="ResetStatus"/>
      <allow send_destination="no.remarkable.update1"
             send_interface="no.remarkable.update1.Manager"
             send_member="GetStatus"/>
    </policy>
    <policy context="default">
      <deny send_destination="no.remarkable.update1" />
    </policy>
  </busconfig>

Command Line Interface
----------------------

.. code-block:: console

  $ update_engine_client -status
  $ update_engine_client -reset_status
  $ update_engine_client -check_for_update
  $ update_engine_client -update
  $ update_engine_client -watch_for_updates

Update File Format
==================

The `protobuf <https://protobuf.dev/>`_ definition of the update file format can be found in `update_metadata.proto </_static/update_metadata.proto>`_.

.. code-block:: c

    struct delta_update_file {
        // Magic characters to identify an update file
        char magic[4] = "CrAU";
        uint64 file_format_version = 1;

        // Size of protobuf DeltaArchiveManifest
        uint64 manifest_size;
        // The Bzip2 compressed DeltaArchiveManifest
        char manifest[];

        // Data blobs for files, no specific format.
        // The specific offset and length of each
        // data blob is recorded in the
        // DeltaArchiveManifest.
        struct {
            char data[];
        } blobs[];

        // Size of protobuf Signatures
        uint64 signatures_message_size;
        // Signatures attached to the update file.
        char signatures_message[];
    };

DeltaArchiveManifest
--------------------

.. code-block:: protobuf

    message DeltaArchiveManifest {
      // Steps to replace a root partititon with the new
      // data. When finished, the replaced partititon
      // should match the hash provided in
      // new_partition_info
      repeated InstallOperation partition_operations = 1;

      // A dummy operation to ensure that the
      // signatures data is ignored while
      // running partition_operations
      repeated InstallOperation noop_operations = 2;

      optional uint32 block_size = 3 [default = 4096];
      optional uint64 signatures_offset = 4;
      optional uint64 signatures_size = 5;

      // Partition data that can be used to validate
      // the update. reMarkable doesn't appear to
      // use old_partition_info
      optional InstallInfo old_partition_info = 8;
      optional InstallInfo new_partition_info = 9;

      // This appears to be unused.
      repeated InstallProcedure procedures = 10;
    }

InstallProcedure
----------------

.. code-block:: protobuf

    message Extent {
      optional uint64 start_block = 1;
      optional uint64 num_blocks = 2;
    }

    message InstallOperation {
      enum Type {
        // Replace destination with attached data
        REPLACE = 0;
        // Replace destination with attached
        // bzipped data
        REPLACE_BZ = 1;
        // Move data from source to destination
        // Appears to be unused
        MOVE = 2;
        // The data is a bsdiff binary diff
        // Appears to be unused
        BSDIFF = 3;
      }
      required Type type = 1;

      // Offset after the manifest in the update file
      // that contains data for this install operation
      optional uint32 data_offset = 2;
      // The length of the data for this install
      // operation
      optional uint32 data_length = 3;

      // Appears to be unused
      repeated Extent src_extents = 4;
      // Only used for Type == REPLACE_BZ
      optional uint64 src_length = 5;

      // Location to update on the root partition
      repeated Extent dst_extents = 6;
      // Only used for Type == REPLACE_BZ
      optional uint64 dst_length = 7;

      // SHA 256 hash of the blob if it has one
      optional bytes data_sha256_hash = 8;
    }

The following example python code can be used to extract the ext4 image from an update file:

.. code-block:: python

    import bz2
    import struct

    from hashlib import sha256

    # This file will need to be generated from
    # update_metadata.proto
    from .update_metadata_pb2 import DeltaArchiveManifest
    from .update_metadata_pb2 import InstallOperation

    with open("update.signed", 'rb') as f, open("update.ext4", 'wb') as o:
        if f.read(4) != b"CrAU":
            raise Exception("Wrong header")

        major = struct.unpack(">Q", f.read(8))[0]
        if major != 1:
            raise Exception("Unsupported version")

        size = struct.unpack(">Q", f.read(8))[0]
        data = f.read(size)
        manifest = DeltaArchiveManifest.FromString(data)
        offset = f.tell()
        block_size = manifest.block_size

        for blob in manifest.partition_operations:
            if blob.type not in (0, 1):
                raise Exception(f"Unsupported type {blob.type}")

            extent = blob.dst_extents[0]
            dst_offset = extent.start_block * block_size
            dst_length = extent.num_blocks * block_size

            f.seek(offset + blob.data_offset)
            data = f.read(blob.data_length)
            if sha256(data).digest() != blob.data_sha256_hash:
                raise Exception("Data has wrong sha256sum")

            if blob.type == InstallOperation.Type.REPLACE_BZ:
                data = bz2.decompress(data)

            if dst_length - len(data) < 0:
                raise Exception("Bz2 compressed data was the wrong length")

            o.seek(dst_offset)
            o.write(data)
            padding = dst_length - len(data)
            if padding < 0:
                raise Exception("Wrong length")

            out.write(b'\x00'*padding)

Signatures
----------

.. code-block:: protobuf

    message Signatures {
      message Signature {
        optional uint32 version = 1;
        optional bytes data = 2;
      }
      repeated Signature signatures = 1;
    }

Signatures are SHA 256 hashes that have been PKCS1v15 padded and encrypted using the private signing key. The SHA 256 hash is of the update file from magic to the end of the blobs. You can retrieve the SHA 256 hash from the signature by using the public key stored on the device at ``/usr/share/update_engine/update-payload-key.pub.pem`` to decrypt it.

The following example python code can be used to retrieve the hash embedded in the signature:

.. code-block:: python

    import struct

    from cryptography.hazmat.primitives.serialization import load_pem_public_key
    from cryptography.hazmat.primitives.asymmetric.padding import PKCS1v15
    from cryptography.hazmat.primitives.hashes import SHA256

    # This file will need to be generated from
    # update_metadata.proto
    from .update_metadata_pb2 import DeltaArchiveManifest

    with open("update.signed", 'rb') as f:
        if f.read(4) != b"CrAU":
            raise Exception("Wrong header")

        major = struct.unpack(">Q", f.read(8))[0]
        if major != 1:
            raise Exception("Unsupported version")

        size = struct.unpack(">Q", f.read(8))[0]
        data = f.read(size)
        manifest = DeltaArchiveManifest.FromString(data)
        f.seek(manifest.signatures_offset)
        data = f.read(manifest.signatures_size)
        signatures = Signatures.FromString(data)
        for signature in signatures.signatures:
            if signature.version == 2:
                break;

        if signature.version != 2:
            raise Exception("Unsupported signature version")

    with open("update-payload-key.pub.pem", 'rb') as f:
        publickey = load_pem_public_key(f)

    publickey.recover_data_from_signature(
        signature.data,
        PKCS1v15(),
        SHA256
    )

InstallProcedure
----------------

This appears to be unused

.. code-block:: protobuf

    message InstallInfo {
      optional uint64 size = 1;
      optional bytes hash = 2;
    }

    message InstallProcedure {
      enum Type {
        KERNEL = 0;
      }
      optional Type type = 1;
      repeated InstallOperation operations = 2;
      optional InstallInfo old_info = 3;
      optional InstallInfo new_info = 4;
    }

External Links
==============

- Fork of upgrade_engine source (Original was made private)
   https://github.com/Eeems/update_engine
- Archive of what appears to be the update server
   https://github.com/reMarkable/omaha-server-legacy
- It seems to be based off of the update-engine for chrome os
   https://chromium.googlesource.com/aosp/platform/system/update_engine/
- Tool to mount update files using FUSE
   https://pypi.org/project/remarkable-update-fuse/
