==========================
Dualbooting the reMarkable
==========================

.. contents:: Contents
   :local:
   :backlinks: none

:raw-html:`<div class="warning">⚠️ Before starting ⚠️<br/>`

This guide requires :doc:`../guide/access/ssh`

:raw-html:`</div>`

Choosing the versions
=====================

Before starting, you should know what versions to dualboot, depending on hat you want to do. For toltec, it is recommended to follow :doc:`this guide <../guide/software/toltec>`, while for rM hacks, you should read `the table on their github repo <https://github.com/mb1986/rm-hacks>`_.

In this example we are assuming that 2.15.1189 is being used for Toltec, and that 3.9.4 is being used for rm-hacks.

Downgrading/Upgrading the OS
============================

To download (and install) a specific OS version, follow :ref:`these instructions <upgrade>`

Installing the switch service
=============================

While this is already a dualboot, it is very impractical, as you need to use `switch.sh <https://github.com/ddvk/remarkable-update/tree/main?tab=readme-ov-file#to-switch-the-partition-ie-boot-the-previous-version>`_ every time. 

To fix this, you can use `a simple systemd service <https://github.com/FouzR/rM_dualboot/>`_.

Installing rM-hacks
===================

reMarkable Hacks can be installed normally but, when loading xochitl from a version without the hacks, at the next reboot, they will disappear.

There are two ways around this problem:

- Bind mounting ``/home/root/.cache/remarkable/xochitl/qmlcache/`` somewhere where it does not get overwritten

- Changing the ``QML_DISK_CACHE_PATH`` variable on the other partition (recommended)

Editing the ``QML_DISK_CACHE_PATH`` variable
--------------------------------------------

The ``QML_DISK_CACHE_PATH`` variable specifies the `QML <https://doc.qt.io/qt-5/qmlapplications.html>`_ cache path of a `Qt application <https://doc.qt.io/qt-5/index.html>`_. This caches the code that is used to generate the xochitl GUI and handle many of it's interactions. When a version of xochitl is launched that does not match the current cache, it is removed and a new cache generated. This will wipe rm-hacks when dual booting, so we will need to setup a new location for the cache.

Setting it on toltec
____________________

If you are running toltec on the second partition (i.e. the one without rM-hacks), you can just create the ``/home/root/.qml`` folder and create a new file ending in .env in ``/opt/etc/xochitl.env.d``, called for example ``99-xochitl.env``, with the following content:

.. code-block:: shell

  export QML_DISK_CACHE_PATH="/home/root/.qml"

Setting it without toltec
_________________________

If you are not running toltec, you can edit the ``/etc/systemd/system/xochitl.service`` file and add the following content **right before** ``ExecStart=/usr/bin/xochitl/system``

.. code-block:: shell

  Environment=QML_DISK_CACHE_PATH="/home/root/.qml"

The following is an example of the modified service

.. code-block:: console

  [Unit]
  Description=reMarkable main application
  StartLimitIntervalSec=600
  StartLimitBurst=4
  OnFailure=remarkable-fail.service
  After=home.mount
  Wants=rm-sync.service

  [Service]
  Environment=QML_DISK_CACHE_PATH="/home/root/.qml"
  ExecStart=/usr/bin/xochitl --system
  Restart=on-failure
  WatchdogSec=60

  [Install]
  WantedBy=multi-user.target

Using rmfakecloud
=================

The cloud must be configured on both partitions, as it will otherwise get disconnected at every reboot due to an invalid login token.
