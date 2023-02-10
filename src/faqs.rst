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

Can I install toltec on my OS version?
======================================

You can find up to date information on what version of the OS is the latest that toltec supports on the `toltec website <https://toltec-dev.org/#install-toltec>`_


Can I install toltec at the same time as ddvk-hacks?
====================================================

Yes! Toltec even ships with a ddvk-hacks package to handle installation for you. While you can install toltec while using the ddvk-hacks automagic install script, it may not play nice with toltec in the future. It is recommended to use the toltec package instead of the automagic script.
