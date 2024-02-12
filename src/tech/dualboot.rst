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

:raw-html:`<div class="warning">⚠️ Note for downgrading ⚠️`

For downgrading, refer to :ref:`upgrade`

:raw-html:`</div>`

Before starting, you should know what versions to dualboot, depending on hat you want to do. For toltec, it is recommended to follow `the toltec website <https://toltec-dev.org/>`_, while for rM hacks, you should read `the table on their github repo <https://gthub.com/mb1986/rm-hacks>`_.

Here, I'll be using 2.15.1189 (for Toltec) and 3.9 (for rm-hacks)

Updating to the first OS
========================

If you already have an OS you want in your dualboot, you can skip this part.

Updating (Most of the times downgrading) is mostly done using `codexctl <https://github.com/Jayy001/codexctl>`_. It is recommended to download codexctl from the latest release on GitHub, but you can also build it yourself.

To download (and install) a specific OS version, plug your reMarkable into your computer via USB and then use

.. code-block:: shell

  codextl install <version>

Where ``<version>`` can be an OS version, ``toltec`` (which installs the latest version supported by toltec) or ``latest`` (which installs the latest version of the OS)

Once it is done, you can tap the "Update done, reboot" button to reboot into the freshly-installed OS

Updating the second OS
======================

:raw-html:`<div class="warning">⚠️ Version warning. ⚠️`

Be careful to run the update from the version you want to keep, as the other one will be wiped.
:raw-html:`</div>`

For this, you will need `codexctl <https://github.com/Jayy001/codexctl>`_, either downloaded from releases or built manually.

To upgrade the OS, you can again use

.. code-block:: shell

  codextl install <version>

Where ``<version>`` can be an OS version, ``toltec`` (which installs the latest version supported by toltec) or ``latest`` (which installs the latest version of the OS)

Once it is done, you can tap the "Update done, reboot" button to reboot into the freshly-installed OS

Installing the switch service
=============================

While this is already a dualboot, it is very impractical, as you need to use `switch.sh <https://github.com/ddvk/remarkable-update/tree/main?tab=readme-ov-file#to-switch-the-partition-ie-boot-the-previous-version>`_ every time. 

To fix this, `a simple systemd service <https://github.com/FouzR/rM_dualboot/>`_ has been made to address this issue. It makes the device change active partition at each reboot, allowing you to boot the previous version of the OS by just restarting the reMarkable.

:raw-html:`<div class="warning">⚠️ Installation notice. ⚠️`

You should install this on both partitions, to be able to successfully dual-boot your reMarkable and not remain "locked" on one partition
:raw-html:`</div>`

To install it on a toltec installation, it is as simple as running 

.. code-block:: shell

    wget -O install.sh https://raw.githubusercontent.com/FouzR/rM_dualboot/main/install.sh && echo "d5d7461daf04a09df2f5d5545ff946cb7f0479caa2587418891c38942536ca0a  install.sh" | sha256sum -c && sh ./install.sh

If you are on a non-toltec partition, instead, you should download a statically compiled wget version that supports TLS (like https://toltec-dev.org/thirdparty/bin/wget-v1.21.1-1) on your host PC and copy it to the reMarkable, before downloading the installer. To do that, you can run

.. code-block:: shell

    # create the necessary folders
    
    scp <path/to/wget> <remarkable ip>:/home/root/wget
    # make sure it is executable
    ssh root@<remarkable IP> 'chmod +x /home/root/wget'
    # run the installer
    ssh root@<remarkable IP> '/home/root/wget -O install.sh https://raw.githubusercontent.com/FouzR/rM_dualboot/main/install.sh && sh ./install.sh'


Installing rM-hacks
===================

reMarkable Hacks can be installed normally but, when loading xochitl from a version without the hacks, at the next reboot, they will disappear.

There are two ways around this problem:

- Bind mounting ``/home/root/.cache/remarkable/xochitl/qmlcache/`` somewhere where it does not get overwritten

- Changing the ``QML_DISK_CACHE_PATH`` variable on the other partition (recommended)

Editing the ``QML_DISK_CACHE_PATH`` variable
--------------------------------------------

The QML_DISK_CACHE_PATH variable specifies the cache path of a QT Application (like  xochitl). It can be set in different ways, depending if you are on toltec or not

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
