============================
Manage System Splash Screens
============================

System splash screens on the device be found in ``/usr/share/remarkable/``. You can manually replace those files to use new splash screens. See :doc:`../access/file-transfer` for more information on how to copy files to the device.

.. contents:: Contents
   :local:
   :backlinks: none

Xochitl Configuration
=====================

For sleep screens, it is possible to set a png path by adding a line in ``/home/root/.config/remarkable/xochitl.conf`` under the General section:

.. code-block:: ini

  [General]
  SleepScreenPath=/home/root/yourcustomfile.png

If the png path is in the /home/root directory, this change will persist across OS updates without requiring any additional action.

This configuration did not take affect from OS versions 3.13 to 3.20.

Restarting xochitl (or the tablet) is required to pick up the configuration change.


Changescrn
==========

Toltec contains the `changescrn <https://github.com/pr0fsmith/rMscreens>`_ package, which provides a command line tool for managing system splash screens.

.. code-block:: shell

  opkg install changescrn

Backing Up Existing System Splash Screens
=========================================

The following command will backup the existing system splash screens.

.. code-block:: shell

  changescrn -b

The backed up files are stored to ``/opt/usr/share/backupscrns``. This is done automatically when installing changescrn with toltec. Backing up a second time will overwrite the initial backup, so you should only do this if there is something wrong with your existing backup, and you know your current splash screens are stock.

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

Changing a System Splash Screen to one in Toltec
================================================

`Toltec contains splash screens <https://toltec-dev.org/stable/#section-splashscreens>`_ that can be installed using :ref:`opkg <opkg>`.

.. code-block:: bash

  opkg install splashscreen-suspended-barnsley_fern

Removing a Splash Screen from Toltec
====================================

Splash screens installed using :ref:`opkg <opkg>` can be removed like any other package:

.. code-block:: shell

  opkg remove splashscreen-suspended-barnsley_fern

