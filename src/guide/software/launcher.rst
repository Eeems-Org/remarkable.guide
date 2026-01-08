==================
Picking a Launcher
==================

Launchers allow you to open and switch between applications. Without them there is no way to run third party applications from the user interface. You would have to SSH into your device to launch them every time you wanted to use them.

After :doc:`index` you will need to install a launcher. Currently there are `three launchers in toltec <https://toltec-dev.org/stable/#section-launchers>`_. Of which we only recommend two for use: Oxide and Remux.

.. contents:: Contents
   :local:
   :backlinks: none

.. _oxide-launcher:

Oxide
=====
`Oxide <https://oxide.eeems.codes/>`_ is a `desktop environment <https://en.wikipedia.org/wiki/Desktop_environment>`_ for your device.

Screenshots
-----------

:raw-html:`<div class="gallery">`

.. image:: /images/launcher/oxide-lockscreen.png
  :class: screenshot
  :alt: oxide lockscreen

.. image:: /images/launcher/oxide-splashscreen.png
  :class: screenshot
  :alt: oxide splashscreen

.. image:: /images/launcher/oxide-launcher.png
  :class: screenshot
  :alt: oxide launcher

.. image:: /images/launcher/oxide-process-manager.png
  :class: screenshot
  :alt: oxide process manager

.. image:: /images/launcher/oxide-task-switcher.png
  :class: screenshot
  :alt: oxide task switcher

.. image:: /images/launcher/oxide-screenshots.png
  :class: screenshot
  :alt: oxide screenshots

:raw-html:`</div>`

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
  launcherctl switch-launcher --start oxide

Remux
=====

`Remux <https://rmkit.dev/apps/remux>`_ is a launcher that does its best to stay out of your way.

Screenshots
-----------

:raw-html:`<div class="gallery">`

.. image:: /images/launcher/remux.png
  :class: screenshot
  :alt: remux launcher

:raw-html:`</div>`

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
  launcherctl switch-launcher --start remux

AppLoad
=======

`AppLoad <https://github.com/asivery/rm-appload>`_ is a `xovi <https://github.com/asivery/xovi>`_ extension that allows running applications directly in xochitl.

:raw-html:`<div class="gallery">`
:raw-html:`</div>`

Features
--------

- Multitasking / Application switching.
- Runs applications as windows inside the main UI application.

Installation
------------

There is no way to install AppLoad with toltec currently.
