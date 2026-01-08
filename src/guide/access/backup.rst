====================
Backing Up Your Data
====================

After connecting to your device, you may want to be able to make backups of your data in addition to, or instead of using the reMarkable cloud, or `rmfakecloud <https://ddvk.github.io/rmfakecloud/>`_.

.. contents:: Contents
   :local:
   :backlinks: none

Backing Up Your Documents
=========================

Documents managed by the built in software (xochitl) are stored in ``/home/root/.local/share/remarkable/xochitl/`` and you can use the following to back them up to your computer:

.. tabs::

  .. code-tab:: bash Linux

    mkdir -p remarkable-backup/files
    scp -r \
      root@remarkable:/home/root/.local/share/remarkable/xochitl/ \
      remarkable-backup/files/

  .. code-tab:: bash macOS

    mkdir -p remarkable-backup/files
    scp -r \
      root@remarkable:/home/root/.local/share/remarkable/xochitl/ \
      remarkable-backup/files/

  .. code-tab:: bat Windows (CMD)

    if not exist remarkable-backup\files mkdir remarkable-backup\files
    scp -r ^
      root@remarkable:/home/root/.local/share/remarkable/xochitl/ ^
      remarkable-backup/files/

  .. code-tab:: pwsh Windows (PowerShell)

    New-Item -ItemType Directory -Force -Path remarkable-backup/files
    scp -r `
      root@remarkable:/home/root/.local/share/remarkable/xochitl/ `
      remarkable-backup/files/


Backing Up Your Configuration
=============================

Xochitl's configuration is stored in ``/home/root/.config/remarkable/xochitl.conf``. This contains the root password in plain text, assuming you haven't changed it on the device.

.. tabs::

  .. code-tab:: bash Linux

    mkdir -p remarkable-backup
    scp -r \
      root@remarkable:/home/root/.config/remarkable/xochitl.conf \
      remarkable-backup/

  .. code-tab:: bash macOS

    mkdir -p remarkable-backup
    scp -r \
      root@remarkable:/home/root/.config/remarkable/xochitl.conf \
      remarkable-backup/

  .. code-tab:: bat Windows (CMD)

    if not exist remarkable-backup mkdir remarkable-backup
    scp -r ^
      root@remarkable:/home/root/.config/remarkable/xochitl.conf ^
      remarkable-backup/

  .. code-tab:: pwsh Windows (PowerShell)

    New-Item -ItemType Directory -Force -Path remarkable-backup
    scp -r `
      root@remarkable:/home/root/.config/remarkable/xochitl.conf `
      remarkable-backup/

Backing Up Other Data
=====================

The ``/home/root`` folder contains data that persists across system upgrades. Third party software may create other files here that you may be interested in backing up. :doc:`Toltec <../software/toltec>` is installed to the ``/home/root/.entware`` folder, which contains both installed packages, and user data. You may want to back up user data portions of this folder.

GUI Tools
=========

- `reMarkable Connection Utility <https://www.davisr.me/projects/rcu/>`_ is a paid tool to manage your reMarkable. This includes making backups of the device.
- `rMExplorer <https://github.com/bruot/pyrmexplorer/wiki>`_ is a tool that allows you to transfer files to and from your device without needing the cloud. This allows you to backup your data.
- `reMarkable HyUtilities <https://github.com/moovida/remarkable-hyutilities>`_ is a tool for managing templates, splashscreens, and backups of your device.

Remarks
=======

These solutions are only for backing up your data on the device, and are not full device backups. As the reMarkable is just a linux machine, there are various solutions out there for full device backups. These are largely not necessary though, as you can restore a stock OS image with :ref:`system upgrades <upgrade>`. If you only use :doc:`toltec <../software/toltec>` for third party software, you can :ref:`reenable <toltec-reenable>` after an upgrade to reinstall your :doc:`../../../guide/software/toltec/toltec` packages.
