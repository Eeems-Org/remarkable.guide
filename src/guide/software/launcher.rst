==================
Picking a Launcher
==================

Launchers allow you to open and switch between applications. Without them there is no way to run third party applications from the user interface. You would have to SSH into your device to launch them every time you wanted to use them.

After :doc:`toltec` you will need to install a launcher. Currently there are `three launchers in toltec <https://toltec-dev.org/stable/#section-launchers>`_. Of which we only recommend two for use: Oxide and Remux.

.. contents:: Contents
   :local:
   :backlinks: none

.. _oxide-launcher:

Oxide
=====
`Oxide <https://oxide.eeems.codes/>`_ is a `desktop environment <https://en.wikipedia.org/wiki/Desktop_environment>`_ for your device.

Screenshots
-----------

.. raw:: html

  <div class="gallery">
    <img src="/_static/launcher/oxide-lockscreen.png" alt="oxide lockscreen" class="screenshot">
    <img src="/_static/launcher/oxide-splashscreen.png" alt="oxide splashscreen" class="screenshot">
    <img src="/_static/launcher/oxide-launcher.png" alt="oxide launcher" class="screenshot">
    <img src="/_static/launcher/oxide-process-manager.png" alt="oxide process manager" class="screenshot">
    <img src="/_static/launcher/oxide-task-switcher.png" alt="oxide task switcher" class="screenshot">
    <img src="/_static/launcher/oxide-screenshots.png" alt="oxide screenshots" class="screenshot">
  </div>

Features
--------

- Multitasking / Application switching.
- Wifi management.
- Optional system lockscreen.
- Automatically suspend tablet after inactivity.
- Pause backgrounded apps.
- Homescreen for selecting applications.
- Process manager.
- Take, view, and manage screenshots.
- Displaying notifications.
- APIs that applications can use to interact with various portions of the environment.

Installation
------------

.. code-block:: shell

  opkg install oxide
  systemctl disable --now xochitl launcher
  systemctl enable --now tarnish

Remux
=====

`Remux <https://rmkit.dev/apps/remux>`_ is a launcher that does it's best to stay out of your way.

Screenshots
-----------

.. raw:: html

  <div class="gallery">
    <img src="/_static/launcher/remux.png" alt="remux launcher" class="screenshot">
  </div>

Features
--------

- Multitasking / Application switching
- Automatically suspends tablet after inactivity.
- Pauses backgrounded apps.
- Ability to stop running applications.

Installation
------------

.. code-block:: shell

  opkg install remux
  systemctl enable --now remux
