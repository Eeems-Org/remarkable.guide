==========
User Input
==========

Both models of the reMarkable tablet have three human interface devices. The wacom digitizer for pen input, a multitouch layer, and button input. Both devices can also support keyboard input, while only the reMarkable 2 supports the folio for keyboard input.

All of these devices are exposed through the `Linux Input Subsystem userspace API <https://www.kernel.org/doc/html/v5.4/input/input_uapi.html>`_.

Most programming languages already have libraries for dealing with input using this interface. Frameworks like Qt also already have built in handling of input.

Here is a small list of libraries you can use for handling input:

- `libevdev <https://www.freedesktop.org/wiki/Software/libevdev/>`_
- `rust evdev crate <https://docs.rs/evdev/latest/evdev/index.html>`_
- `python evdev library <https://pypi.org/project/evdev/>`_
- `node evdev library <https://github.com/sdumetz/node-evdev>`_
