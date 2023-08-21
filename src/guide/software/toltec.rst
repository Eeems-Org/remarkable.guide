=================
Installing Toltec
=================
.. raw:: html

  <div class="warning">
    ⚠️ Always refer to the <a href="https://toltec-dev.org">toltec website</a> for up to date information ⚠️
    <p>
      The website contains up to date information on what version of the OS is supported, as well as the latest installation steps.
    </p>
  </div>

Toltec is a community-maintained repository of free software for the `reMarkable tablet <https://remarkable.com/>`_. It is the recommended way to install software on the device. While you can manually install software on your device, this is fraught with compatibility issues, as well as different standards that may not be compatibile. Toltec makes sure that software works together and applies standards that work together for all the packages it contains.

.. contents:: Contents
   :local:
   :backlinks: none

Install Toltec
==============

After setting up :doc:`../access/ssh`, follow the `toltec installation instructions <https://toltec-dev.org/#install-toltec>`_ to install toltec.

.. _opkg:

Using Toltec
============

Toltec gives you access to the following command line tools for managing the installation:

- ``opkg`` - Used for installing, removing, and upgrading packages in your installation.
- ``toltecctl`` - Used for managing the entire toltec installation.

Installing a Package
--------------------

The following command will install a package, you will need to replace ``<package>`` with the name of the package you wish to install. This will automatically install any dependencies required for the package. Pay special attention to the output as it may give you further instructions for steps needed to use the package.

.. code-block:: shell

  opkg install <package>

Removing a Package
------------------

The following command will remove a package, you will need to replace ``<package>`` with the name of the package you wish to remove. This will not remove any dependencies that were automatically installed along with the package. It may also not allow you to uninstall the package if another package depends on it. You can specify multiple package names at one time, which will be required if two packages depend upon each other.

.. code-block:: shell

  opkg remove <package>

Updating Your Installation
--------------------------

The following commands will upgrade all the packages on your system to the latest versions available.

.. code-block:: shell

  opkg update
  opkg upgrade

Uninstall Toltec
----------------

The following command will uninstall totlec from your device. This includes removing any modifications to the root partition.

.. code-block:: shell

  toltecctl uninstall

.. _toltec-reenable:

Reenable Toltec After A System Upgrade
--------------------------------------

After a system upgrade, the root partition has been completly replaced with a stock OS. Toltec will need to be reenabled, which will recreate the necessary modifications to the root partition.

.. code-block:: shell

  toltecctl reenable
