============================
Manage System Splash Screens
============================

System splash screens on the device be found in ``/usr/share/remarkable/``. You can manually replace those files to use new splash screens. See :doc:`../access/file-transfer` for more information on how to copy files to the device.

.. contents:: Contents
   :local:
   :backlinks: none

Changescrn
==========

.. raw:: html

  <div class="warning">
    ⚠️ Changescrn is not in toltec stable yet. ⚠️
    <p>
      <a href="https://github.com/toltec-dev/toltec/pull/722">You can watch this pull request</a>
      to see the current status of the package being merged into stable.
    </p>
  </div>

Toltec contains the `changescrn <https://github.com/pr0fsmith/rMscreens>`_ package, which provides a command line tool for managing system splash screens.

.. code-block:: shell

  opkg install changescrn

Backing Up Existing System Splash Screens
=========================================

The following command will backup the existing system splash screens.

.. code-block:: shell

  changescrn -b

The backed up files are stored to ``/opt/usr/share/backupscrns``. Backing up a second time will overwrite the initial backup, so only run it once after installing or :ref:`reenabling toltec after a system upgrade <toltec-reenable>`.

Restoring System Splash Screens from Backup
===========================================

The following command will restore the system splash screens from ``/opt/usr/share/backupscrns``.

.. code-block:: shell

  changescrn -r all

If you'd like to restore a specific screen you can use the following command. You will need to replace ``<screen>`` with the name of the splash screen you wish to restore.

.. code-block:: bash

  changescrn -r <screen>
  # For Example
  changescrn -r suspended

Changing a System Splash Screen
===============================

The following command will change a system splash screen to the newly specified file:

.. code-block:: shell

  changescrn -c <screen> <image-path>
  # For Example
  changescrn -c suspended my-file.png

See :doc:`../access/file-transfer` for more information on how to copy files to the device.
