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


External Links
==============

- ArchWiki article on Bluetooth
   https://wiki.archlinux.org/title/Bluetooth
- Kernel Module documentation in the i.MX knowledge base
   https://community.nxp.com/t5/i-MX-Processors-Knowledge-Base/Bluetooth-NXP-UART-Driver-Linux-BSP-6-1-22-btnxpuart/ta-p/1708588
- Documentation for bluetoothctl and related commands
   https://man.archlinux.org/listing/extra/bluez-utils/
