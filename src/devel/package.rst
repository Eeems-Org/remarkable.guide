=========================
Creating a Toltec Package
=========================

Toltec packages are one of the best ways to distribute software for the device. They allow automatic dependency management, as well as automate the majority of the install and uninstall work. They can also be distributed outside of the toltec repository itself, either with a custom repository, or directly.

Toltecmk
========

`Toltecmk <https://pypi.org/project/toltecmk/>`_ is a tool used to take a package recipe, and turn it into an ``ipk`` package file. It's available in pypi and can be installed with ``pip``.

.. code-block:: console

  $ pip install toltecmk

Toltecmk also requires docker to be installed, configured, and running on your system.

Example Package
===============

You can find more thorough documentation in the `official toltec package guide <https://github.com/toltec-dev/toltec/blob/stable/docs/package-guide.md>`_.

Below is a very basic example package recipe. This will create a package that installs ``my-program`` to ``/opt/bin/my-program``.

.. code-block:: bash

  pkgname=my-package
  pkgdesc="An example package"
  url=https://example.com
  pkgver=0.0.1-1
  timestamp=2020-10-09T18:15Z
  section=util
  maintainer="My Name <me@example.com>"
  license=MIT

  image=toolchain:v3.1
  source=(src.tar.gz)
  sha256sums=(SKIP)

  package() {
      install -D -m 755 -t "$pkgdir"/opt/bin \
        "$srcdir"/my-program
  }

To build this package you will need to run the following command from the folder containing ``package`` and ``src.tar.gz``:

.. code-block:: shell

  toltecmk

Github Action
=============

The following example github action will compile a package and upload it as a build artifact to your repository:

.. code-block:: yaml

  on:
    push:
    pull_request:
  jobs:
    build:
      name: Build and package
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v3
        - name: Setup Python
          uses: actions/setup-python@v4
          with:
            python-version: '3.11'
        - name: Install toltecmk
          run: pip install toltecmk
        - name: Build package
          run: |
            tar -czvf src.tar.gz src
            toltecmk
        - name: Save packages
          uses: actions/upload-artifact@v3
          with:
            name: packages
            path: release

External Links
==============

- Toltec Documentation
   https://github.com/toltec-dev/toltec/tree/stable/docs
- toltecmk
   https://pypi.org/project/toltecmk/
- Toltec shapes library
   https://github.com/toltec-dev/shapes
