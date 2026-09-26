==========
User Input
==========

Both models of the reMarkable tablet have three human interface devices. The wacom digitizer for pen input, a multitouch layer, and button input. Both devices can also support keyboard input, while only the reMarkable 2 and Paper Pro supports a folio for keyboard input.

All of these devices are exposed through the `Linux Input Subsystem userspace API <https://www.kernel.org/doc/html/v5.4/input/input_uapi.html>`_.

Most programming languages already have libraries for dealing with input using this interface. Frameworks like Qt also already have built in handling of input.

Here is a small list of libraries you can use for handling input:

- `libevdev <https://www.freedesktop.org/wiki/Software/libevdev/>`_
- `rust evdev crate <https://docs.rs/evdev/latest/evdev/index.html>`_
- `python evdev library <https://pypi.org/project/evdev/>`_
- `node evdev library <https://www.npmjs.com/package/evdev>`_

reMarkable 1 input devices
--------------------------

reMarkable 1 pen input
^^^^^^^^^^^^^^^^^^^^^^

- EV_SYN
- EV_KEY

  - BTN_TOOL_PEN
  - BTN_TOOL_RUBBER
  - BTN_TOUCH
  - BTN_STYLUS
  - BTN_SYLUS2
- EV_ABS

  - ABS_X: 0 to 20967
  - ABS_Y: 0 to 15725
  - ABS_PRESSURE: 0 to 4095
  - ABS_DISTANCE: 0 to 255
  - ABS_TILT_X: -9000 to 9000
  - ABS_TILT_Y: -9000 to 9000

reMarkable 1 button input
^^^^^^^^^^^^^^^^^^^^^^^^^

- EV_SYN
- EV_KEY

  - KEY_HOME
  - KEY_LEFT
  - KEY_RIGHT
  - KEY_POWER
  - KEY_WAKEUP

reMarkable 1 touch input
^^^^^^^^^^^^^^^^^^^^^^^^

- EV_SYN
- EV_KEY
- EV_REL
- EV_ABS

  - ABS_DISTANCE: 0 to 255
  - ABS_MT_SLOT: 0 to 31
  - ABS_MT_TOUCH_MAJOR: 0 to 255
  - ABS_MT_TOUCH_MINOR: 0 to 255
  - ABS_MT_ORIENTATION: -127 to 127
  - ABS_MT_POSITION_X: 0 to 767
  - ABS_MT_POSITION_Y: 0 to 1023
  - ABS_MT_TOOL_TYPE: 0 to 1
  - ABS_MT_TRACKING_ID: 0 to 65535
  - ABS_MT_PRESSURE: 0 to 255
  - INPUT_PROP_DIRECT

reMarkable 2 input devices
--------------------------

reMarkable 2 pen input
^^^^^^^^^^^^^^^^^^^^^^

- EV_SYN
- EV_KEY

  - BTN_TOOL_PEN
  - BTN_TOOL_RUBBER
  - BTN_TOOL_TOUCH
  - BTN_TOOL_STYLUS
  - BTN_TOOL_STYLUS2

- EV_ABS

  - ABS_X: 0 to 20966
  - ABS_Y: 0 to 15725
  - ABS_PRESSURE: 0 to 4095
  - ABS_DISTANCE: 0 to 255
  - ABS_TILT_X: -9000 to 9000
  - ABS_TILT_Y: -9000 to 9000

reMarkable 2 button input
^^^^^^^^^^^^^^^^^^^^^^^^^

- EV_SYN
- EV_KEY

  - KEY_POWER

reMarkable 2 touch input
^^^^^^^^^^^^^^^^^^^^^^^^

- EV_SYN
- EV_KEY

  - KEY_F1
  - KEY_F2
  - KEY_F3
  - KEY_F4
  - KEY_F5
  - KEY_F6
  - KEY_F7
  - KEY_F8
- EV_REL
- EV_ABS

  - ABS_DISTANCE: 0 to 255
  - ABS_MT_SLOT: 0 to 31
  - ABS_MT_TOUCH_MAJOR: 0 to 255
  - ABS_MT_TOUCH_MINOR: 0 to 255
  - ABS_MT_ORIENTATION: -127 to 127
  - ABS_MT_POSITION_X: 0 to 1403
  - ABS_MT_POSITION_Y: 0 to 1871
  - ABS_MT_TOOL_TYPE: 0 to 1
  - ABS_MT_TRACKING_ID: 0 to 65535
  - ABS_MT_PRESSURE: 0 to 255
  - INPUT_PROP_DIRECT
