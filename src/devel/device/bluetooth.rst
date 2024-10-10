=========
Bluetooth
=========

The reMarkable 1 and 2 do not have bluetooth. The reMarkable Paper Pro does have bluetooth hardware, but the driver is not loaded by default.

Enabling bluetooth
------------------

.. code-block:: shell

  modprobe btnxpuart
  bluetoothctl show


.. raw:: html

    <div class="warning">
        ⚠️ Experimental. ⚠️

The following information is from individual user experimentation, where information is still being gathered 

.. raw:: html

    </div>


Connecting a Device
-------------------

.. code-block:: shell

  [bluetooth]# power on
  Changing power on succeeded
  [CHG] Controller 00:10:20:30:40:50 Powered: yes
  
  [bluetooth]# scan on
  Discovery started
  [CHG] Controller 00:10:20:30:40:50 Discovering: yes
  [NEW] Device 00:12:34:56:78:90 device name
  [CHG] Device 00:12:34:56:78:90 LegacyPairing: yes
  
  [bluetooth]# pair 00:12:34:56:78:90
  Attempting to pair with 00:12:34:56:78:90
  [CHG] Device 00:12:34:56:78:90 Connected: yes
  [CHG] Device 00:12:34:56:78:90 Connected: no
  [CHG] Device 00:12:34:56:78:90 Connected: yes
  Request PIN code
  [agent] Enter PIN code: 1234
  [CHG] Device 00:12:34:56:78:90 Paired: yes
  Pairing successful
  [CHG] Device 00:12:34:56:78:90 Connected: no
  
  [bluetooth]# connect 00:12:34:56:78:90
  Attempting to connect to 00:12:34:56:78:90
  [CHG] Device 00:12:34:56:78:90 Connected: yes
  Connection successful


External Links
==============

- Arch-Wiki on Bluetooth
   https://wiki.archlinux.org/title/Bluetooth
- Arch-Wiki on Bluetooth section on Pairing
   https://wiki.archlinux.org/title/Bluetooth#Pairing
- Arch-Wiki on Bluetooth section on Configuration
   https://wiki.archlinux.org/title/Bluetooth#Configuration
- Kernel Module documentation in the i.MX knowledge base
   https://community.nxp.com/t5/i-MX-Processors-Knowledge-Base/Bluetooth-NXP-UART-Driver-Linux-BSP-6-1-22-btnxpuart/ta-p/1708588
- Bluez (bluetoothctl) homepage
   https://www.bluez.org/
