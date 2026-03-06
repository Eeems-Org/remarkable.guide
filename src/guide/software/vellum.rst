======
Vellum
======

Vellum is a community-maintained repository of free software for the `reMarkable tablet <https://remarkable.com/>`_. It is the recommended way to install software on the device. While you can manually install software on your device, this is fraught with compatibility issues, as well as different standards that may not be compatible. Vellum makes sure that software works together and applies standards that work together for all the packages it contains.

.. contents:: Contents
   :local:
   :backlinks: none

Install Vellum
==============

After setting up :doc:`../access/ssh`, follow the `vellum-cli installation instructions <https://github.com/vellum-dev/vellum-cli?tab=readme-ov-file#installation>`_ to install vellum. You can also use `reManager <https://github.com/rmitchellscott/reManager>`_ to install vellum on your device.

Using Vellum
============

Installing a Package
--------------------

The following command will install a package, you will need to replace ``<package>`` with the name of the package you wish to install. This will automatically install any dependencies required for the package. Pay special attention to the output as it may give you further instructions for steps needed to use the package.

.. code-block:: shell

  vellum add <package>


Removing a Package
------------------

The following command will remove a package, you will need to replace ``<package>`` with the name of the package you wish to remove. This will not remove any dependencies that were automatically installed along with the package. It may also not allow you to uninstall the package if another package depends on it. You can specify multiple package names at one time, which will be required if two packages depend upon each other.

.. code-block:: shell

  vellum remove <package>

Updating Your Installation
--------------------------

The following commands will upgrade all the packages on your system to the latest versions available.

.. code-block:: shell

  vellum update
  vellum upgrade

Uninstall Vellum
----------------

The following command will uninstall vellum from your device. This includes removing any modifications to the root partition.

.. code-block:: shell

  velum self uninstall

Reenable Vellum After A System Upgrade
--------------------------------------

After a system upgrade, the root partition has been completely replaced with a stock OS. Vellum will need to be reenabled, which will recreate the necessary modifications to the root partition.

.. code-block:: shell

  vellum reenable
