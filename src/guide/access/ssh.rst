==========
SSH Access
==========

:raw-html:`<div class="warning">⚠️ Make sure you write down your SSH password. ⚠️<br/>`
If you don't write down your password and lose access to the UI, you will be unable to access your device. An :doc:`../../tech/recovery` will be required.

It is also recommended to setup a `ssh-key`_ instead of using password authentication.
:raw-html:`</div>`

.. contents:: Contents
   :local:
   :backlinks: none

Finding Your Device Password and IP Addresses
=============================================

If your device version is 3.8 or lower
--------------------------------------
1. Connect your device to Wifi, or with a USB cable to your computer.
2. On your device, open the Menu from the main page.
3. Select "Settings".
4. Select "Help".
5. Select "Copyright and licenses".
6. You will find your password and the IP addresses you can use to access your device underneath the "GPLv3 Compliance" header.

If your device version is 3.9 or higher
---------------------------------------
1. Connect your device to Wifi, or with a USB cable to your computer.
2. On your device, open the Menu from the main page.
3. Select "Settings".
4. Select "About".
5. Select "Copyright and licenses".
6. You will find your password and the IP addresses you can use to access your device underneath the "GPLv3 Compliance" header.

Connecting via SSH
==================

`SSH (Secure Shell) <https://en.wikipedia.org/wiki/Secure_Shell>`_ allows you to remotely login to a command line on a device. The reMarkable has a `dropbear SSH server <https://matt.ucc.asn.au/dropbear/dropbear.html>`_ running on it that allows you to connect as the `root user <https://en.wikipedia.org/wiki/Superuser>`_ with no configuration required.

Picking a SSH client
--------------------

Newer versions of windows already come with OpenSSH installed. If it is not installed you can `install OpenSSH for windows <https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui>`_ (Only the OpenSSH client is needed). You may also use `PuTTY <https://putty.org/>`_.

On MacOS and Linux you will have OpenSSH or a compatible SSH client installed already that can be used.

Connecting over USB
-------------------

After you connect your device to your computer with a USB cable, it will setup a local network over the USB cable that can be used to access the device. You can use this for SSH, as well as the :doc:`../../tech/usb-web-interface`.

From your computer you can now use your SSH client to connect to your reMarkable using ``10.11.99.1`` as the hostname.

.. tabs::

  .. code-tab:: bash Linux

    ssh root@10.11.99.1

  .. code-tab:: bash macOS

    ssh root@10.11.99.1

  .. code-tab:: bat Windows (CMD)

    ssh root@10.11.99.1

  .. code-tab:: pwsh Windows (PowerShell)

    ssh root@10.11.99.1

Connecting over Wifi
--------------------

When your device is connected to Wifi, you can connect to it with SSH using the IP address(es) assigned by your router. Replace ``<ip-address>`` in the following command with a valid IP Address for your device. See `Finding Your Device Password and IP Addresses`_ for information on how to find the IP address.

.. tabs::

  .. code-tab:: bash Linux

    ssh root@<ip-address>

  .. code-tab:: bash macOS

    ssh root@<ip-address>

  .. code-tab:: bat Windows (CMD)

    ssh root@<ip-address>

  .. code-tab:: pwsh Windows (PowerShell)

    ssh root@<ip-address>

Depending on your network configuration, your reMarkable may also be available via hostname like ``remarkable``, ``remarkable.local``, or ``remarkable.lan``.

.. tabs::

  .. code-tab:: bash Linux

    ssh root@remarkable
    ssh root@remarkable.local
    ssh root@remarkable.lan

  .. code-tab:: bash macOS

    ssh root@remarkable
    ssh root@remarkable.local
    ssh root@remarkable.lan

  .. code-tab:: bat Windows (CMD)

    ssh root@remarkable
    ssh root@remarkable.local
    ssh root@remarkable.lan

  .. code-tab:: pwsh Windows (PowerShell)

    ssh root@remarkable
    ssh root@remarkable.local
    ssh root@remarkable.lan

.. _ssh-key:

Setting Up a SSH Key
====================

:raw-html:`<div class="warning">⚠️ You may need to enable ssh-rsa keys. ⚠️`

If you encounter the following error when attempting to use a SSH key:

  Unable to negotiate with 10.11.99.1 port 22: no matching host key type found. Their offer: ssh-rsa

You will need to enable ssh-rsa keys. See :ref:`enable-ssh-rsa` for more information.
:raw-html:`</div>`

Creating a SSH Key
-------------------

A SSH key allows you to connect to your device over SSH without having to use the password.

If you are using `PuTTY <https://putty.org/>`_, you will need to use `PuTTYgen <https://the.earth.li/~sgtatham/putty/0.78/htmldoc/Chapter8.html#pubkey-puttygen>`_ to generate your SSH key instead.

The following command will generate a private and public SSH key pair:

.. code-block:: shell

  ssh-keygen \
    -f ~/.ssh/id_rsa_remarkable \
    -N ''

.. tabs::

  .. code-tab:: bash Linux

    ssh-keygen \
      -f ~/.ssh/id_rsa_remarkable \
      -N ''

  .. code-tab:: bash macOS

    ssh-keygen \
      -f ~/.ssh/id_rsa_remarkable \
      -N ''

  .. code-tab:: bat Windows (CMD)

    ssh-keygen ^
      -f %userprofile%/.ssh/id_rsa_remarkable ^
      -N ''

  .. code-tab:: pwsh Windows (PowerShell)

    ssh-keygen `
      -f ~/.ssh/id_rsa_remarkable `
      -N ''

:raw-html:`<div class="warning">⚠️ The generated SSH key will not have a password. ⚠️`

This is a minor security concern, as anybody who can access the file will be able to use it to access your device. You can generate one with a password by using the following command instead:

.. tabs::

  .. code-tab:: bash Linux

    ssh-keygen -f ~/.ssh/id_rsa_remarkable

  .. code-tab:: bash macOS

    ssh-keygen -f ~/.ssh/id_rsa_remarkable

  .. code-tab:: bat Windows (CMD)

    ssh-keygen -f ~/.ssh/id_rsa_remarkable

  .. code-tab:: pwsh Windows (PowerShell)

    ssh-keygen -f ~/.ssh/id_rsa_remarkable

:raw-html:`</div>`

Installing a SSH Key on Your Device
-----------------------------------

After you've created your SSH key private and public key pair, you'll need to install your public key to your device. This way it will trust the private key used by your computer when it attempts to connect over SSH.

If you are using `PuTTY <https://putty.org/>`_, you will need to follow the `PuTTYgen documentation <https://the.earth.li/~sgtatham/putty/0.78/htmldoc/Chapter8.html#pubkey-gettingready>`_ for installing your SSH key instead.

The following command will install your SSH public key on your device:

.. tabs::

  .. code-tab:: bash Linux

    ssh-copy-id \
      -i ~/.ssh/id_rsa_remarkable \
      root@10.11.99.1

  .. code-tab:: bash macOS

    ssh-copy-id \
      -i ~/.ssh/id_rsa_remarkable \
      root@10.11.99.1

  .. code-tab:: bat Windows (CMD)

    ssh-copy-id ^
      -i ~/.ssh/id_rsa_remarkable ^
      root@10.11.99.1

  .. code-tab:: pwsh Windows (PowerShell)

    ssh-copy-id `
      -i ~/.ssh/id_rsa_remarkable `
      root@10.11.99.1

:raw-html:`<div class="warning">⚠️ This will not work properly until OpenSSH 9.4. ⚠️`

Due to a bug in ssh-copy-id this installs to the wrong location on the device on versions of OpenSSH older than 9.4. You can check your version of OpenSSH with the following command on your computer:


.. tabs::

  .. code-tab:: bash Linux

    ssh -V

  .. code-tab:: bash macOS

    ssh -V

  .. code-tab:: bat Windows (CMD)

    ssh -V

  .. code-tab:: pwsh Windows (PowerShell)

    ssh -V

.. raw:: html

  <p>For these versions you can use the following commands to install your public key instead:</p>

.. tabs::

  .. code-tab:: bash Linux

    ssh root@10.11.99.1 \
      mkdir -p -m 700 /home/root/.ssh
    cat ~/.ssh/id_rsa_remarkable.pub \
    | ssh root@10.11.99.1 \
      tee -a /home/root/.ssh/authorized_keys
    ssh root@10.11.99.1 \
      chmod 600 /home/root/.ssh/authorized_keys

  .. code-tab:: bash macOS

    ssh root@10.11.99.1 \
      mkdir -p -m 700 /home/root/.ssh
    cat ~/.ssh/id_rsa_remarkable.pub \
    | ssh root@10.11.99.1 \
      tee -a /home/root/.ssh/authorized_keys
    ssh root@10.11.99.1 \
      chmod 600 /home/root/.ssh/authorized_keys

  .. code-tab:: bat Windows (CMD)

    ssh root@10.11.99.1 ^
      mkdir -p -m 700 /home/root/.ssh
    type ~/.ssh/id_rsa_remarkable.pub ^
    | ssh root@10.11.99.1 ^
      tee -a /home/root/.ssh/authorized_keys
    ssh root@10.11.99.1 ^
      chmod 600 /home/root/.ssh/authorized_keys

  .. code-tab:: pwsh Windows (PowerShell)

    ssh root@10.11.99.1 `
      mkdir -p -m 700 /home/root/.ssh
    type ~/.ssh/id_rsa_remarkable.pub `
    | ssh root@10.11.99.1 `
      tee -a /home/root/.ssh/authorized_keys
    ssh root@10.11.99.1 `
      chmod 600 /home/root/.ssh/authorized_keys

:raw-html:`</div>`

.. _ssh_config:

SSH Config File
===============
You can set up an alias that is easier to remember by adding the following lines to the ``~/.ssh/config`` file on your computer:

.. code-block:: text

  host remarkable
    Hostname 10.11.99.1
    User root
    Port 22
    IdentityFile ~/.ssh/id_rsa_remarkable

This will allow you to simplify how you connect to your device over SSH.

.. tabs::

  .. code-tab:: bash Linux

    ssh remarkable

  .. code-tab:: bash macOS

    ssh remarkable

  .. code-tab:: bat Windows (CMD)

    ssh remarkable

  .. code-tab:: pwsh Windows (PowerShell)

    ssh remarkable

External Resources
==================

- ``ssh`` command
   https://www.man7.org/linux/man-pages/man1/ssh.1.html
- ``ssh-keygen`` command
   https://www.man7.org/linux/man-pages/man1/ssh-keygen.1.html
- ``ssh-copy-id`` command
   https://man.archlinux.org/man/core/openssh/ssh-copy-id.1.en
- SSH config file manual
   https://www.man7.org/linux/man-pages/man5/ssh_config.5.html
