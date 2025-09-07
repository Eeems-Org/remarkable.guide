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

The reMarkable Paper Pro and Paper Pro Move have backlights that can be adjusted to make the screens easier to read in different lighting conditions.

Adjusting in the UI
-------------------
Xochitl provides 5 presets of backlight brightness, which can be accessed by swiping down from the top-right of the screen to open the `quick settings menu <https://support.remarkable.com/s/article/Quick-settings>`_

OS version 3.19 introduced a "Light Boost" toggle available in Settings > Display > Extra Bright.

The Xochitl backlight presets are as follows:

.. list-table:: reMarkable Paper Pro
   :header-rows: 1
   :widths: 20 40 40
   
   * - Preset
     - Normal
     - Extra Bright
   * - 1
     - 260 (12%)
     - 942 (46%)
   * - 2
     - 694 (32%)
     - 1289 (63%)
   * - 3
     - 1040 (50%)
     - 1636 (80%)
   * - 4
     - 1387 (67%)
     - 1850 (90%)
   * - 5
     - 1734 (84%)
     - 2025 (99%)

.. list-table:: reMarkable Paper Pro Move
   :header-rows: 1
   :widths: 20 40 40
   
   * - Preset
     - Normal
     - Extra Bright
   * - 1
     - 120 (6%)
     - 800 (39%)
   * - 2
     - 550 (27%)
     - 1100 (54%)
   * - 3
     - 900 (44%)
     - 1500 (73%)
   * - 4
     - 1200 (59%)
     - 1600 (78%)
   * - 5
     - 1600 (78%)
     - 1800 (88%)

Adjusting programmatically
--------------------------

:raw-html:`<div class="warning">⚠️ Warning. ⚠️<br>`
Setting the brightness outside of the range you can select in xochitl will make the battery drain faster, and may have unintended side effects that could damage the device.
:raw-html:`</div>`

The backlight can also be adjusted programmatically by writing to the `/sys/class/backlight/rm_frontlight/brightness` file.
The value written to this file should be between 0 and 2047, where 0 is completely off and 2047 is the maximum brightness.

.. code-block:: shell

  echo 1734 > /sys/class/backlight/rm_frontlight/brightness

External Links
==============

- Linux FrameBuffer API
   https://www.kernel.org/doc/html/latest/fb/api.html
