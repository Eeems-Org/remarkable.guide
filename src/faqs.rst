==========================
Frequently Asked Questions
==========================
.. contents::
   :depth: 1
   :local:
   :backlinks: none

- `Toltec FAQs <https://toltec-dev.org/#frequently-asked-questions>`_
- `Old Wiki Articles <https://web.archive.org/web/20230616050052/https://remarkablewiki.com/faq/start>`_

Is it safe to factory reset my device?
======================================

Not exactly. The factory reset mechanism isn't a true factory reset. It will wipe your data partition, but it doesn't do anything to the root partition where the OS is installed. This can soft brick your device if you have toltec installed, or other third party software. The :doc:`tech/factory-reset` page contains instructions on how to properly factory reset your device.

There have been instances where factory resetting without third party software installed results in the SSH password no longer displaying on the "Copyright and licenses" screen. This appears to be due to the root partition running out of space. See `My device is connected to wifi, but can't sync or check for updates, how can I fix this?`_ for more information on resolving this.

How do I remove all third party software from my device?
========================================================

This all depends on how you installed them. If you installed toltec, it has a simple uninstall command: `toltecctl uninstall`. This will remove toltec and all of it's changes.

If you installed ddvk-hacks with it's automagic script, it also provides `another script to uninstall the hacks <https://github.com/ddvk/remarkable-hacks#uninstall--removal>`_.

For other third party software, they may provide an uninstall script, or they may not. If they don't, you'll need to either ask the author for instructions, or to work through what the installation script does and undo it.

.. _upgrade:

Can I downgrade to a different OS version?
==========================================

Yes! You can use `codexctl <https://github.com/Jayy001/codexctl>`_ to download and install different OS versions on your device.

The file format used to store lines you draw in notebooks/pdfs/epubs sometimes changes between versions. This means that if you downgrade, you may not be able to open one, or all, of your notebooks until you upgrade again.

How get back to stable after installing the beta?
=================================================

First leave the beta program. After that, follow the instructions in `Can I downgrade to a different OS version?`_ to downgrade to an older version. After you downgrade, you will be able to go through the normal upgrade process to get to the latest available stable version.

Can I install toltec on my OS version?
======================================

You can find up to date information on what version of the OS is the latest that toltec supports on the `toltec website <https://toltec-dev.org/#install-toltec>`_

Can I install toltec before my OS version is supported?
=======================================================

On a reMarkable 2, you **will** soft-brick your device if you install toltec on an unsupported version. Due to how the display is accessed by third party software on a reMarkable 2, your device will **no longer** be able to display anything to the screen until you uninstall toltec. If you know what you are doing, you can provide a custom rm2fb configuration file to resolve this. This requires knowing how to find the values needed. It also may not work if there is a large enough change in this OS release that breaks rm2fb support without code changes.

On a reMarkable 1, you **might** soft-brick your device if there are any breaking changes with the underlying dependencies. This doesn't happen often, but there have been several OS updates that require changes to the toolchain used to build toltec in order for it to work properly.

For both devices, there may be issues with packages (like custom kernels) that could soft brick your device. Packages may have other issues and not work as expected before the OS version is supported.

Why doesn't toltec support the beta OS versions?
================================================

As part of the `EULA <https://support.remarkable.com/s/article/End-user-agreement-for-Opt-In-Beta>`_ you agree to in order to be able to install the beta, you agree that you will not install third party software on the device.

Can I install toltec at the same time as ddvk-hacks?
====================================================

Yes! Toltec even ships with a ddvk-hacks package to handle installation for you. While you can install toltec while using the ddvk-hacks automagic install script, it may not play nice with toltec in the future. It is recommended to use the toltec package instead of the automagic script.

I updated my OS, but now I can't SSH into my device. How do I fix it?
=====================================================================

Every time you update your OS, the cryptographic key used to identify the device over SSH is regenerated. This means that the software you are using to SSH into your device will no longer trust it and refuse to connect. To resolve this you need to remove the entry for the reMarkable in your ``known_hosts`` file on your computer. This is usually located in the ``.ssh`` folder in your home directory. The software you use to SSH may have these values stored elsewhere.

What happens to third party software when I update or downgrade my OS?
======================================================================

When you update or downgrade your OS, the entire root partition is replaced with the new OS. Only the data partition, which is all files under ``/home`` is left untouched. This means that any third party software that relies on modifying files outside of ``/home`` will need to be reapplied.

For software with toltec you just need to follow the instructions in :ref:`toltec-reenable`. For third party software installed with other methods, you will need to check their instructions.

I noticed something incorrect on this site, how do I get that fixed?
====================================================================

Take a look at the `README on GitHub <https://github.com/Eeems-Org/remarkable.guide/#can-i-make-changes>`_. Issues and Pull Requests are welcome.

My device is connected to wifi, but can't sync or check for updates, how can I fix this?
========================================================================================

You could attempt the following troubleshooting steps:

1. Ensure that your network works with another device.
2. Test with another network, like a hotspot from your phone.
3. Ensure that your device has free space on the root partition. This is not the same as the space used to store notebooks.

   - To check the amount of free space available, :doc:`ssh into your device <guide/access/ssh>` and run the following:

     .. code-block:: shell

       df -h /

   - If it reports ``Use%`` as ``100%`` you can attempt to clear some by running the following command on your device:

     .. code-block:: shell

       journalctl --vacuum-size=1

   - If running ``df -h /`` still reports ``Use%`` as ``100%``, you may need to remove other files from your device. If you have installed :doc:`custom templates <guide/software/templates>`, :doc:`splash screens <guide/software/screens>`, or fonts, you may need to remove them.
   - If you still are unable to free up space, ask for help on the `community discord <https://discord.gg/ATqQGfu>`_.

My device is stuck on the power off screen and wont turn on, what do I do?
==========================================================================

When your reMarkable is showing the powered off screen, but won't turn on, your battery is probably completely depleted. Because of how the e-Ink technology works, the screen will continue to show the power off message. It will take a while of charging until there's enough battery to restart the device.

Let the device charge for a few hours and then try to turn it on again. If it still wont turn on, ask for help on the `community discord <https://discord.gg/ATqQGfu>`_.

.. _enable-ssh-rsa:

How do I resolve the "no matching host key type found. Their offer: ssh-rsa" error when attempting to SSH into my device?
=========================================================================================================================

Starting with OpenSSH 8.8 ssh-rsa keys are `disabled by default <https://www.openssh.com/txt/release-8.7>`_, which is causing this error. Some Linux distros like Fedora 33 have also disabled weaker ssh-rsa keys independently of OpenSSH. That means you could face the same issue on OpenSSH versions lower than 8.8, depending on the distro you are on.

To allow ssh-rsa keys, add the following lines to your :ref:`ssh_config`:

.. code-block:: bash

  PubkeyAcceptedKeyTypes +ssh-rsa
  HostKeyAlgorithms +ssh-rsa


Why would I use SSH over USB instead of wifi?
=============================================

SSH over USB on the device is much faster than SSH over wifi.
