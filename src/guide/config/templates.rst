================
Manage Templates
================

Templates on the device can be found in ``/usr/share/remarkable/templates/``, and are registered in ``/usr/share/remarkable/templates/templates.json``.

.. contents:: Contents
   :local:
   :backlinks: none

Manually Installing a Template
==============================

1. If you have not done so already, install `templatectl <https://github.com/PeterGrace/templatectl>`_:

.. code-block:: shell

  opkg install templatectl

2. Copy the template file to the ``/opt/share/remarkable/templates`` folder. See :doc:`../access/file-transfer` for more information on how to copy files to the device.
3. Use `templatectl <https://github.com/PeterGrace/templatectl>`_ to register the template:

.. code-block:: shell

  templatectl add \
    -n "Noso Cube Low Density" \
    -f "noso-cube-low.png" \
    -c "Custom" \
    -c "Grids"

Manually Removing a Template
============================

1. Unregister the template with `templatectl <https://github.com/PeterGrace/templatectl>`_

.. code-block:: shell

  templatectl remove --name "Noso Cube Low Density"

2. Remove the template file from ``/opt/share/remarkable/templates``

Installing a Template from Toltec
=================================

:doc:`../software/toltec` `contains templates <https://toltec-dev.org/stable/#section-templates>`_ that can be installed using :ref:`opkg <opkg>`.

.. code-block:: shell

  opkg install template-noso-grid

Removing a Template from Toltec
===============================

Templates installed using :ref:`opkg <opkg>` can be removed like any other package:

.. code-block:: shell

  opkg remove template-noso-grid
