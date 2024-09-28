==================
Emergency Recovery
==================

If you soft-brick your device by losing access to both the user interface and SSH, you will need to recovery your device.

reMarkable 1 Recovery
=====================

You can use `remarkable-uuuflash <https://github.com/ddvk/remarkable-uuuflash>`_ to recover your device. This process only requires connecting your device to a computer with a USB cable in order to work.

reMarkable 2 Recovery
=====================

You can use `remarkable2-recovery <https://github.com/ddvk/remarkable2-recovery>`_ to recover your device.

This process requires building a custom pogo connector for the device, and to short the SBU1 and SBU2 pins of the USB-c connector. This is `detected on boot to put the device into recovery mode <https://github.com/reMarkable/uboot/blob/zero-sugar/board/reMarkable/zero-sugar/serial_download_trap.c>`_.

reMarkable Paper Pro Recovery
=============================

You can follow the official documentation for how to perform recovery on your rM Paper Pro: https://support.remarkable.com/s/article/Software-recovery
