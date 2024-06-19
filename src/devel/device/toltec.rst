===============
Toltec Overview
===============

.. raw:: html

    <div class="warning">
        ⚠️ FIXME. ⚠️

This page is just a stub that needs to be completed. You can `open a PR on the repo <https://github.com/Eeems-Org/remarkable.guide>`_ to add more content to the page.

.. raw:: html

    </div>

Filesystem Layout
=================

/opt
----

/opt/etc
--------

/opt/etc/init.d
---------------

Entware packages will add executable scripts here to manage services that you
install. Toltec allows you to manage this with ``rcctl``, which is provided by
the ``entware-rc`` package.

/opt/bin
--------

/opt/libexec
------------

/opt/sbin
---------

/opt/share/remarkable/templates
-------------------------------

/opt/share/launcherctl
----------------------

Executable files in this folder will be treated as possible launchers for
``launcherctl``.

/opt/share/toltec/reenable.d
----------------------------

Contains empty files owned by packages to indicate that they make changes to
the root partition, and will need to be reinstalled when re-enabling toltec
after an update.

/opt/usr/share/backupscrns
--------------------------

Used by ``changescrn`` to backup the stock splashscreens.

/opt/share/remarkable/splashscreens
-----------------------------------

This directory contains the active splashscreen from an installed toltec package.

/opt/usr/share/kernelctl
------------------------

Contains ``tar.bz2`` archives that kernelctl uses to manage the currently
installed linux kernel.

/opt/usr/share/licenses
-----------------------

Some toltec applications will include their licenses, which will be installed
to this folder. Entware doesn't include licenses in it's packages, due to
potential space constraints on the systems it targets.

/opt/share/zoneinfo
-------------------
The ``zoneinfo-utils`` package will mount this to ``/usr/share/zoneinfo`` to
allow ``timedatectl`` to access the full set of timezones. Instead of the subset
that the device comes with.

Systemd Services
================

entware-rc@.service
-------------------

opt.mount
---------

rm2fb.service
-------------

launcher.service
----------------

Launcher Application Registration
=================================

Launcher Registration
=====================

- ``/opt/share/launcherctl/<name>``
- Must be executable.
- Must implement the following:

  - ``is-active``
  - ``is-enabled``
  - ``start``
  - ``stop``
  - ``enable``
  - ``disable``
  - ``logs [-f|--follow]``
  - ``apps``
  - ``running``
  - ``paused``
  - ``launch <name>``
  - ``resume <name>``
  - ``close <name>``
  - ``pause <name>``

Kernels
=======

- /opt/usr/share/kernelctl
