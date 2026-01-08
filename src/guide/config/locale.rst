==========================
Changing the Device Locale
==========================

Custom applications depend upon the system locale, which is not managed by xochitl. The `localectl <https://www.man7.org/linux/man-pages/man1/localectl.1.html>`_ command line utility is used to change the locale of the device. You will need to replace ``<locale>`` with the new locale you wish to use. For example: ``en_US.UTF-8``.

.. code-block:: shell

  localectl set-locale <locale>

To see all available locales you can use the following command:

.. code-block:: shell

  localectl list-locales

Unfortunately the device only comes with two locales, and :doc:`../software/toltec` does not currently expose more locales that can be used by the system.
