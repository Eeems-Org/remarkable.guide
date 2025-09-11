============================
Manage System Splash Screens
============================

:raw-html:`<div class="warning">⚠️ File Persistence ⚠️<br/>`

Files stored in ``/usr/share/remarkable/`` will be overwritten with every OS update.

reMarkable Paper Pro and Paper Pro Move require :ref:`additional steps <why-do-some-changes-not-persist-on-the-remarkable-paper-pro>` to write to ``/usr/``.
:raw-html:`</div>`

System splash screens on the device be found in ``/usr/share/remarkable/``. You can manually replace those files to use new splash screens. See :doc:`../access/file-transfer` for more information on how to copy files to the device.

.. _changescrn:

The `changescrn tool <https://github.com/pr0fsmith/rMscreens>`_ provides a command line utility for managing system splash screens. It can be downloaded directly from the GitHub repo or installed as a Toltec package.

To install it via Toltec:

.. code-block:: shell

  opkg install changescrn

.. contents:: Contents
   :local:
   :backlinks: none

Backing Up Existing System Splash Screens
=========================================

Using Changescrn
----------------

The following command will backup the existing system splash screens:

.. code-block:: shell

  changescrn -b

The backed up files are stored to ``/opt/usr/share/backupscrns``. This is done automatically when installing changescrn with toltec. Backing up a second time will overwrite the initial backup, so you should only do this if there is something wrong with your existing backup, and you know your current splash screens are stock.

Manual Method
-------------

To manually backup your system splash screens, copy them to a safe location:

.. code-block:: shell

  mkdir -p /home/root/splash-backup
  cp /usr/share/remarkable/*.png /home/root/splash-backup/

This creates a backup in your home directory that will persist across OS updates.


Restoring System Splash Screens from Backup
===========================================

Using Changescrn
----------------

The following command will restore all system splash screens from ``/opt/usr/share/backupscrns``:

.. code-block:: shell

  changescrn -r all

If you'd like to restore a specific screen you can use the following command. You will need to replace ``<screen>`` with the name of the splash screen you wish to restore:

.. code-block:: bash

  changescrn -r <screen>
  # For Example
  changescrn -r suspended

Manual Method
-------------

To manually restore your backed up splash screens:

.. code-block:: shell

  cp /home/root/splash-backup/*.png /usr/share/remarkable/
  systemctl restart xochitl

Replace ``/home/root/splash-backup/`` with the path where you stored your backups.


Changing a System Splash Screen
===============================

Configuration File for Sleep Screen
-----------------------------------
:raw-html:`<div class="warning">⚠️ Does not work on all OS versions. ⚠️`
This will only work if your OS version is 3.2 to 3.13, or if the OS is 3.20 or newer.
:raw-html:`</div>`

For the sleep screen, it is possible to set a custom png path by adding a line in ``/home/root/.config/remarkable/xochitl.conf`` under the General section:

.. code-block:: ini

  [General]
  SleepScreenPath=/home/root/yourcustomfile.png

Restarting the xochitl service (or the tablet) is required to pick up the configuration change.

Using Changescrn
----------------

The following command will change a system splash screen to the newly specified file:

.. code-block:: shell

  changescrn -c <screen> <image-path>
  # For Example
  changescrn -c suspended my-file.png

Manual Method
-------------

To manually replace a splash screen, copy your new image file to the appropriate location:

.. code-block:: shell

  cp /path/to/your/image.png /usr/share/remarkable/suspended.png
  systemctl restart xochitl

Splash screen files include:

- ``suspended.png`` - Sleep screen
- ``poweroff.png`` - Shutdown screen  
- ``starting.png`` - Boot screen
- ``batteryempty.png`` - Low battery screen
- ``rebooting.png`` - Restart screen


Using Toltec Splash Screens
----------------------------
.. _changing-a-system-splash-screen-to-one-in-toltec:
.. _removing-a-splash-screen-from-toltec:


`Toltec contains splash screens <https://toltec-dev.org/stable/#section-splashscreens>`_ that can be installed using :ref:`opkg <opkg>`:

.. code-block:: bash

  opkg install splashscreen-suspended-barnsley_fern

To remove a splash screen installed from Toltec:

.. code-block:: shell

  opkg remove splashscreen-suspended-barnsley_fern
