=====================
Cloud Synchronization
=====================

.. raw:: html

    <div class="warning">
        ⚠️ FIXME. ⚠️

This page is just a stub that needs to be completed. You can `open a PR on the repo <https://github.com/Eeems-Org/remarkable.guide>`_ to add more content to the page.

.. raw:: html

    </div>

Sync Systemd Service
====================

``sync.service``. Renamed to ``rm-sync.service`` on OS 3.5. Toltec masks this service and instead has a ``manual-sync.service`` that breaks a hard dependency on the ``xochitl.service`` unit.

DBus Interface
--------------

.. code-block:: xml

  <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
    "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
  <busconfig>
    <policy user="root">
      <allow own="no.remarkable.sync" />
      <allow send_destination="no.remarkable.sync" />
    </policy>
    <policy user="core">
      <!-- introspection is denied -->
      <deny send_destination="no.remarkable.sync"
            send_interface="org.freedesktop.DBus.Introspectable" />
      <!-- properties denied -->
      <deny send_destination="no.remarkable.sync"
            send_interface="org.freedesktop.DBus.Properties" />
      <!-- allow explicit methods -->
      <allow send_destination="no.remarkable.sync"
             send_interface="no.remarkable.sync.Synchronizer"
             send_member="Execute"/>
    </policy>
    <policy context="default">
      <deny send_destination="no.remarkable.sync" />
    </policy>
  </busconfig>

Command Line Interface
----------------------

``sync`` is renamed to ``rm-sync`` in OS 3.5.

.. code-block:: console

  $ sync --client
  $ sync --no-service --usertoken <usertoken> --basepath /home/root/.local/share/remarkable
