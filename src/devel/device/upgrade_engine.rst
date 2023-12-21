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

External Links
==============

- Fork of upgrade_engine source (Original was made private)
   https://github.com/Eeems/update_engine
- Archive of what appears to be the update server
   https://github.com/reMarkable/omaha-server-legacy
- It seems to be based off of the update-engine for chrome os
   https://chromium.googlesource.com/aosp/platform/system/update_engine/
