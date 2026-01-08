==========================
Dualbooting the reMarkable
==========================

.. contents:: Contents
   :local:
   :backlinks: none

.. warningbox::
  :title: Before starting

  This guide requires :doc:`../guide/access/ssh`

Choosing the versions
=====================

Before starting, you should know what versions to dualboot, depending on hat you want to do. For toltec, it is recommended to follow :doc:`the toltec guide <../guide/software/toltec>`, while for rM hacks, you should read `the table on their github repo <https://github.com/mb1986/rm-hacks>`_.

Downgrading/Upgrading the OS
============================

For more information on how to install a specific OS version see :ref:`upgrade`.

Installing the switch service
=============================

While this is already a dualboot, it is very impractical, as you need to use `switch.sh <https://github.com/ddvk/remarkable-update/tree/main?tab=readme-ov-file#to-switch-the-partition-ie-boot-the-previous-version>`_ every time. 

`FouzR/rM_dualboot <https://github.com/FouzR/rM_dualboot>`_ handles setting up both partitions to automatically run ``switch.sh`` every time the device is rebooted.

Installing rM-hacks
===================

To install rm-hacks, follow the `rm-hacks installation instructions <https://github.com/mb1986/rm-hacks?tab=readme-ov-file#installation>`_. After this, you will need to make changes to ensure that it doesn't get removed when you reboot into the other partition. There are two ways to handle this. The recommended way is to change the ``QML_DISK_CACHE_PATH`` environment variable. The other option would be to bind mount 
``/home/root/.cache/remarkable/xochitl/qmlcache/`` to a different location.

Editing the ``QML_DISK_CACHE_PATH`` variable
--------------------------------------------

The ``QML_DISK_CACHE_PATH`` variable specifies the `QML <https://doc.qt.io/archives/qt-5.15/qmlapplications.html>`_ cache path of a `Qt application <https://doc.qt.io/archives/qt-5.15/index.html>`_. This caches the code that is used to generate the xochitl GUI and handle many of its interactions. When a version of xochitl is launched that does not match the current cache, it is removed and a new cache generated. This will wipe rm-hacks when dual booting, so we will need to setup a new location for the cache.

Setting it on toltec
____________________

If you are running :doc:`../guide/software/toltec` on the second partition you can create an environment override for xochitl that will set the ``QML_DISK_CACHE_PATH``.

.. code-block:: shell

  mkdir -p /home/root/.cache/qmlcache
  cat > /opt/etc/xochitl.env.d/99-override-qmldir.env << EOF
  export QML_DISK_CACHE_PATH="/home/root/.cache/qmlcache"
  EOF

Setting it without toltec
_________________________

If you are not running :doc:`../guide/software/toltec`, you can override the xochitl ``QML_CACHE_PATH`` using systemd override files.

.. code-block:: shell

  # Create overrides folder
  mkdir /etc/systemd/system/xochitl.service.d
  # Create override
  cat > /etc/systemd/system/xochitl.service.d/override-qmlcache.conf << EOF
  [Service]
  Environment=QML_DISK_CACHE_PATH="/home/root/.qml/"
  EOF
  # Reload units
  systemctl daemon-reload
  # Restart xochitl


Using rmfakecloud
=================

The cloud must be `configured <https://ddvk.github.io/rmfakecloud/remarkable/setup>`_ on both partitions, as it will otherwise get disconnected at every reboot due to an invalid login token.
