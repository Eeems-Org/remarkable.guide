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

Toltec uses entware as a base, which means that it tries to follow the filesystem layout that entware uses. Toltec generally tries to follow the same file hierarchy as `archlinux <https://man.archlinux.org/man/file-hierarchy.7.en>`_, when applicable.

/opt
----

Entware, and to the most part, :doc:`../../../guide/software/toltec/toltec`, stores all of its data in a folder that is mounted to ``/opt``. Toltec puts this folder in ``/home/root/.entware``. All packages are compiled with the assumption that they are stored under ``/opt``.

/opt/etc
--------

Configuration files for packages are generally stored in this directory instead of in ``/etc``.

/opt/etc/draft
--------------

This directory contains application registrations for draft and remux. See `Launcher Application Registration`_ for more information.

/opt/etc/init.d
---------------

Entware packages will add executable scripts here to manage services that you
install. Toltec allows you to manage this with ``rcctl``, which is provided by
the ``entware-rc`` package.

/opt/bin
--------

User executables should be placed in this folder, which makes them available on the user's path.

/opt/libexec
------------

Contains executables that have name conflicts with other executables (e.g. ``wget-ssl`` or ``wget-nossl``). The selected version will be symlinked to ``/opt/bin``.

/opt/sbin
---------

Some packages place their executables in this directory, which is discouraged. ``/opt/bin`` should be used instead.

/opt/share/remarkable/templates
-------------------------------

When ``templatectl`` is installed, this contains the current templates used by xochitl, as it's bind mounted over ``/usr/share/remarkable/templates``. Any template packages that are installed will store their files here and use ``templatectl`` to register them.

/opt/share/launcherctl
----------------------

Executable files in this folder will be treated as possible launchers for ``launcherctl``. See `Launcher Registration`_ for more information.

/opt/share/toltec/reenable.d
----------------------------

Contains empty files owned by packages to indicate that they make changes to
the root partition, and will need to be reinstalled when re-enabling :doc:`../../../guide/software/toltec/toltec`
after an update.

/opt/usr/share/applications
---------------------------

This directory contains application registrations for oxide. See `Launcher Application Registration`_ for more information.

/opt/usr/share/backupscrns
--------------------------

Used by ``changescrn`` to backup the stock splashscreens.

/opt/share/remarkable/splashscreens
-----------------------------------

This directory contains the active splashscreen from an installed :doc:`../../../guide/software/toltec/toltec` package.

/opt/usr/share/kernelctl
------------------------

Contains ``tar.bz2`` archives that kernelctl uses to manage the currently
installed linux kernel.

/opt/usr/share/licenses
-----------------------

Some :doc:`../../../guide/software/toltec/toltec` applications will include their licenses, which will be installed
to this folder. Entware doesn't include licenses in its packages, due to
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

- `Draft launcher format <https://github.com/dixonary/draft-reMarkable/?tab=readme-ov-file#configuration-files>`_
- `Oxide application registration <https://oxide.eeems.codes/documentation/03_application_registration_format.html>`_

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
