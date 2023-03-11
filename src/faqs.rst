=========================
Frequenty Asked Questions
=========================

Is it safe to factory reset my device?
======================================

Not exactly. The factory reset mechanism isn't a true factory reset. It will wipe your data partition, but it doesn't do anything to the root partition where the OS is installed. This can soft brick your device if you have toltec installed, or other third party software. You can find some more information on the `reMarkableWiki <https://remarkablewiki.com/trouble/factory-reset>`_.

How do I remove all third party software from my device?
========================================================

This all depends on how you installed them. If you installed toltec, it has a simple uninstall command: `toltecctl uninstall`. This will remove toltec and all of it's changes.

If you installed ddvk-hacks with it's automagic script, it also provides `another script to uninstall the hacks <https://github.com/ddvk/remarkable-hacks#uninstall--removal>`_.

For other third party software, they may provide an uninstall script, or they may not. If they don't, you'll need to either ask the author for instructions, or to work through what the installation script does and undo it.

Can I downgrade to a different OS version?
==========================================

Yes! You can install any OS verion you want with `remarkable-update <https://github.com/ddvk/remarkable-update>`_.

If you use a reMarkable 2, there is another tool that has been built on top of this that simplifies the process called `rm-update-helper <https://github.com/Jayy001/rm-update-helper>`_.

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

Can I install toltec at the same time as ddvk-hacks?
====================================================

Yes! Toltec even ships with a ddvk-hacks package to handle installation for you. While you can install toltec while using the ddvk-hacks automagic install script, it may not play nice with toltec in the future. It is recommended to use the toltec package instead of the automagic script.

I updated my OS, but now I can't SSH into my device. How do I fix it?
=====================================================================

Every time you update your OS, the cryptographic key used to identify the device over SSH is regenerated. This means that the software you are using to SSH into your device will no longer trust it and refuse to connect. To resolve this you need to remove the entry for the reMarkable in your ``known_hosts`` file on your computer. This is usually located in the ``.ssh`` folder in your home directory. The software you use to SSH may have these values stored elsewhere.
