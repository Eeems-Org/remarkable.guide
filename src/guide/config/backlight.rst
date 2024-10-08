============================
Changing the Device Backlight
============================

The ReMarkable Paper Pro has a backlight that can be adjusted to make the screen easier to read in different lighting conditions.

Adjusting manually
============================
Xochitl provides 5 presets of backlight brightness, which can be accessed by swiping down from the top-right of the screen to open the quick settings menu.

The Xochitl backlight presets are as follows:

#. 260 (12%)
#. 694 (32%)
#. 1040 (50%)
#. 1387 (67%)
#. 1734 (84%)

Adjusting programmtically
============================

:raw-html:`<div class="warning">⚠️ Warning. ⚠️<br>`
Setting the brightness too high may cause the device to overheat and potentially damage the screen.
:raw-html:`</div>`

The backlight can also be adjusted programmatically by writing to the `/sys/class/backlight/backlight/brightness` file.
The value written to this file should be between 0 and 2047, where 0 is completely off and 2047 is the maximum brightness.

.. code-block:: shell

  echo 2047 > /sys/class/backlight/backlight/brightness
