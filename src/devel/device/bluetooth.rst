=========
Bluetooth
=========

The reMarkable 1 and 2 do not have bluetooth. The reMarkable Paper Pro does have bluetooth hardware, but the driver is not loaded by default.

Enabling bluetooth
------------------

.. code-block:: shell

  modprobe btnxpuart
  bluetoothctl show


:raw-html:`<div class="warning">⚠️ FIXME. ⚠️`

This page is just a stub that needs to be completed. You can `open a PR on the repo <https://github.com/Eeems-Org/remarkable.guide>`_ to add more content to the page.
:raw-html:`</div>`


Connecting a Device
-------------------

.. code-block:: shell

  bluetoothctl


This will drop you into an interactive prompt for running bluetoothctl commands.
 
.. code-block:: shell
   power on
   scan on
   # Wait for the mac address for the device you are interested to show up
   pair <mac-address>
   # You will be prompted to enter a PIN code for the device
   connect <mac-address>
   trust <mac-address>


Troubleshooting
---------------
If a ``Failed to set power on: org.bluez.Error.Busy`` error is shown after trying to run the command ``bluetoothctl power on``, or if a ``Failed to start discovery: org.bluez.Error.NotReady`` is shown when running the command ``bluetooth scan on``, the ``bluetooth.service`` might be having issues with the access to its configuration.

To verify if the service is having issues, check the bluetooth service first:

.. code-block:: shell
  systemctl status bluetooth


If a line with this text is shown, you have an issue on the service:

.. code-block:: shell

  ConfigurationDirectory 'bluetooth' already exists but the mode is different. (File system: 755 ConfigurationDirectoryMode: 555)


To fix it stop the bluetooth service, change the configuration folder permissions, and start the service again.

.. code-block:: shell

  systemctl stop bluetooth
  chmod 555 /etc/bluetooth
  systemctl start bluetooth


External Links
==============

- ArchWiki article on Bluetooth
   https://wiki.archlinux.org/title/Bluetooth
- Kernel Module documentation in the i.MX knowledge base
   https://community.nxp.com/t5/i-MX-Processors-Knowledge-Base/Bluetooth-NXP-UART-Driver-Linux-BSP-6-1-22-btnxpuart/ta-p/1708588
- Documentation for bluetoothctl and related commands
   https://man.archlinux.org/listing/extra/bluez-utils/
