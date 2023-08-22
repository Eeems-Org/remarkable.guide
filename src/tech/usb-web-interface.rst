=================
USB Web Interface
=================

There is an optional web interface that can be turned on that allows you upload and export files from the device.

.. contents:: Contents
   :local:
   :backlinks: none

Enable the interface
====================
See the official `Transferring files using a USB cable <https://support.remarkable.com/s/article/Transferring-files-using-a-USB-cable>`_ article for up to date information.

1. Open the Menu from the main page.
2. Select "Settings".
3. Select "Storage".
4. Toggle "USB web interface" on.

API
===

The USB Web Interface exposes the following API endpoints that can be used to interact with the xochitl filesystem.

``POST http://10.11.99.1/documents/``
-------------------------------------

Get the document and folders list for the root folder.

**Example:**

.. code:: bash

  curl \
    --silent \
    http://10.11.99.1/documents/ \
  | jq -r 'map({(.ID): {VissibleName,Type}}) | add'

``POST http://10.11.99.1/documents/{guid}``
-------------------------------------------

Get the documents and folders list for a specific folder.

**Example:**

.. code:: bash

  guid=fd2c4b2c-3849-46c3-bf2d-9c80994cc985
  curl \
    --silent \
    "http://10.11.99.1/documents/$guid" \
  | jq -r 'map({(.ID): {VissibleName,Type}}) | add'

``GET http://10.11.99.1/download/{guid}/placeholder``
-----------------------------------------------------

Download the PDF for a specific document.

**Example:**

.. code:: bash

  guid=fd2c4b2c-3849-46c3-bf2d-9c80994cc985
  curl \
    -I "http://10.11.99.1/download/$guid/placeholder"

``POST http://10.11.99.1/upload``
---------------------------------

Upload a document to the last folder that was listed.

**Example:**

.. code:: bash

  file=Get_started_with_reMarkable.pdf
  curl \
    'http://10.11.99.1/upload' \
    -H 'Origin: http://10.11.99.1' \
    -H 'Accept: */*' \
    -H 'Referer: http://10.11.99.1/' \
    -H 'Connection: keep-alive' \
    -F "file=@$file;filename=$(basename "$file");type=application/pdf"

External links
==============

- Make the usb web interface available after the usb cable has been disconnected: `webinterface-persist-ip <https://github.com/rM-self-serve/webinterface-persist-ip>`_
- Make the usb web interface available immediately after starting the device: `webinterface-onboot <https://github.com/rM-self-serve/webinterface-onboot>`_
- Make the usb web interface available over wifi: `webinterface-wifi <https://github.com/rM-self-serve/webinterface-wifi>`_
- Add an upload button to the usb web interface: `upload_button <https://github.com/rM-self-serve/upload_button>`_
