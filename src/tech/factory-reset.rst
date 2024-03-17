=============
Factory Reset
=============

.. raw:: html

    <div class="warning">
        ⚠️ Never perform the built-in factory reset with xochitl disabled. ⚠️

This will create a new SSH password and wipe the data directory. You will no longer be able to access this password as xochitl will not start, and any launcher you have installed will have been removed, which means there will be no usable interface.

This will cause you to lose access to your device, unless you have an :ref:`SSH Key <ssh-key>` setup. You will then have to attempt to :doc:`recover your device <recovery>`.

.. raw:: html

    </div>

In order to factory reset the device you will need to do the following steps:

1. Uninstall any manually added third party software or modifications.
2. Uninstall toltec:

.. code-block:: shell

  toltecctl uninstall

3. Ensure that xochitl is enabled:

.. code-block:: shell

  systemctl enable --now xochitl

4. Perform two :ref:`system upgrades <upgrade>`.
5. Perform a factory reset through the UI.
