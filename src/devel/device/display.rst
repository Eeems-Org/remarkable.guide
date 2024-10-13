=======
Display
=======

.. raw:: html

    <div class="warning">
        ⚠️ FIXME. ⚠️

This page is just a stub that needs to be completed. You can `open a PR on the repo <https://github.com/Eeems-Org/remarkable.guide>`_ to add more content to the page.

.. raw:: html

    </div>

`Old wiki article <https://web.archive.org/web/20230331221031/https://remarkablewiki.com/tech/display>`_

.. _rm2fb:

reMarkable 2 Framebuffer
========================

https://github.com/ddvk/remarkable2-framebuffer


Changing the Device Backlight
=============================

The reMarkable Paper Pro has a backlight that can be adjusted to make the screen easier to read in different lighting conditions.

Adjusting in the UI
-------------------
Xochitl provides 5 presets of backlight brightness, which can be accessed by swiping down from the top-right of the screen to open the `quick settings menu <https://support.remarkable.com/s/article/Quick-settings>`_

The Xochitl backlight presets are as follows:

#. 260 (12%)
#. 694 (32%)
#. 1040 (50%)
#. 1387 (67%)
#. 1734 (84%)

Adjusting programmatically
--------------------------

:raw-html:`<div class="warning">⚠️ Warning. ⚠️<br>`
Setting the brightness outside of the range you can select in xochitl will make the battery drain faster, and may have unintended side effects that could damage the device.
:raw-html:`</div>`

The backlight can also be adjusted programmatically by writing to the `/sys/class/backlight/backlight/brightness` file.
The value written to this file should be between 0 and 2047, where 0 is completely off and 2047 is the maximum brightness.

.. code-block:: shell

  echo 1734 > /sys/class/backlight/backlight/brightness

