=============
Factory Reset
=============

.. raw:: html

    <div class="warning">
        ⚠️ Never perform the built-in factory reset with xochitl disabled. ⚠️
        <p>
            This will create a new SSH password and wipe the data directory. You will no longer be able to access this password as xochitl will not start, and any launcher you have installed will have been removed, which means there will be no usable interface.
            <br/>
            This will cause you to lose access to your device, unless you have an <a href="../guide/access/ssh.html#ssh-key">SSH key</a> setup. You will then have to attempt to <a href="recovery.html">recover your device</a>.
        </p>
    </div>

In order to factory reset the device you will need to do the following steps:

1. Revert any changed :doc:`screens <../guide/software/screens>`.
2. Revert any changed :doc:`templates <../guide/software/templates>`.
3. Uninstall any manually added third party software or modifications.
4. Uninstall toltec: ``toltecctl uninstall``
5. Ensure that xochitl is enabled: ``systemctl enable --now xochitl``
6. Perform two :ref:`system upgrades <upgrade>`.
7. Perform a factory reset through the UI.
