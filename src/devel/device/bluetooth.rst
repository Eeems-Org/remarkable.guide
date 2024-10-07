====
Bluetooth
====

By default Bluetooth is not configured to work. But the module exists, the kernel is built to use it.

Enabling bluetooth
------------------------

.. code-block:: shell

  ssh root@10.11.99.1
  root@imx8mm-ferrari:~# modprobe btnxpuart
  root@imx8mm-ferrari:~# bluetoothctl
  Agent registered
  [CHG] Controller 24:FD:FA:01:6E:A3 Pairable: yes
  [bluetooth]# show
  Controller 24:FD:FA:01:6E:A3 (public)
    Name: imx8mm-ferrari
    Alias: imx8mm-ferrari
    Class: 0x00000000
    Powered: no
    Discoverable: no
    DiscoverableTimeout: 0x000000b4
    Pairable: yes
    UUID: Generic Attribute Profile (00001801-0000-1000-8000-00805f9b34fb)
    UUID: Generic Access Profile    (00001800-0000-1000-8000-00805f9b34fb)
    UUID: PnP Information           (00001200-0000-1000-8000-00805f9b34fb)
    UUID: A/V Remote Control Target (0000110c-0000-1000-8000-00805f9b34fb)
    UUID: A/V Remote Control        (0000110e-0000-1000-8000-00805f9b34fb)
    UUID: Device Information        (0000180a-0000-1000-8000-00805f9b34fb)
    Modalias: usb:v1D6Bp0246d0541
    Discovering: no
    Roles: central
    Roles: peripheral
  Advertising Features:
    ActiveInstances: 0x00 (0)
    SupportedInstances: 0x06 (6)
    SupportedIncludes: tx-power
    SupportedIncludes: appearance
    SupportedIncludes: local-name
    SupportedSecondaryChannels: 1M
    SupportedSecondaryChannels: 2M
    SupportedSecondaryChannels: Coded
