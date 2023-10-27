============================
Changing the Device Timezone
============================

Custom applications depend upon the system timezone, which is not managed by xochitl.

.. contents:: Contents
   :local:
   :backlinks: none

Temporarily Changing the Timezone
=================================

You can temporarily change the timezone by setting the ``$TZ`` environment variable. This will apply to any application you run with that environment variable set.

.. code-block:: shell

  TZ="CET"

Permanently Changing the Timezone
=================================

The `timedatectl <https://www.man7.org/linux/man-pages/man1/timedatectl.1.html>`_ command line utility is used to change the current timezone of the device. You will need to replace ``<zone/subzone>`` With the identifier for your timezone, for example: ``US/Alaska``, ``America/New_York``, or ``UTC``.

.. code-block:: shell

  timedatectl set-timezone <zone/subzone>

Available Timezones
===================

The device does not come with the full set of timezones that ``timedatectl list-timezones`` lists. To see what timezones are available, you can inspect the ``/usr/share/zoneinfo`` folder. Toltec contains the full set of timezones that can be installed with the following command:

.. code-block:: shell

  opkg install zoneinfo-utils
  opkg install zoneinfo-all

After installing the full set of timezones, you can use ``timedatectl list-timezones`` to inspect the available timezones to select.
