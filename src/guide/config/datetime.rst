=================================
Changing the Device Date and Time
=================================

While you can change the date and time on the device through xochitl, you can also do it progamatically. The `timedatectl <https://www.man7.org/linux/man-pages/man1/timedatectl.1.html>`_ command line utility is used to change the date and time of the device. You will need to replace ``<time>`` with the new time you wish to use. For example: ``2012-10-30 18:17:16``.

.. code-block:: shell

  timedatectl set-time <time>
