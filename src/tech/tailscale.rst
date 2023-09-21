=========
Tailscale
=========

You can use `tailscale <https://tailscale.com/>`_ to set up convenient VPN connections between devices, including reMarkable devices.
The details below have been tested on a reMarkable 2.

Several guides explaining various parts of this setup exist:

- `<https://addcnin.blue/2021/10/26/remarkable-tailscale/>`_
- `<https://gist.github.com/cceckman/eafd57463f757d9488749a9ea87d808c>`_
- `<https://web.archive.org/web/20230619091850/https://remarkablewiki.com/tips/tailscale>`_

Setting up Tailscale isn't particularly hard, especially if you already have Toltec installed,
but because reMarkable doesn't support ``dev/net/tun``, you'll need to do extra work if you want to establish outgoing connections to other devices on your tailnet.

Why use Tailscale?
==================

For the same reasons you'd use it on any other PC.
Tailscale lets you build "tailnets," giving you VPN connections between computers running a client that's signed into (or shared with) your account.
Casually speaking, you can imagine they're all on your home network, even though they might be spread out all over the Internet.
Tailscale is a very versatile tool that's good for networking almost any kind of common computer or VM together.
You might want to run some service on your home network that you'd like to be able to access from outside your home network,
to be able to copy files back-and-forth between your tablet and another computer at home,
to be able to SSH into another device from your tablet,
or something even wackier.

Basic setup
===========

You'll need ``tailscale`` and ``tailscaled``, which are both available on Entware through Toltec in the ``tailscale`` package.
Get it with ``opkg install tailscale``.
You can also configure tailscale to automatically run via SystemD. This is available via the ``tailscale-systemd`` package.
Get it with ``opkg install tailscale-systemd``.

Since you're working on a device that doesn't support ``tun``, tailscale is configured to use userspace networking.
If you want to place outgoing connections on your tailnet, you need one or both of the proxies that were set up,
and then you'll need to configure the application making that outbound connection to use the appropriate proxy.
(There's some more detail `on Tailscale's userspace networking docs <https://tailscale.com/kb/1112/userspace-networking/>`_).

Once you have ``tailscaled`` running, you'll need to run ``tailscale up`` to log in.
You may want to use ``tailscale up --ssh --qr``, which will enable SSH to your device with the authentication handled by the tailnet
(this isn't a replacement for backing up your password and setting up keypair login!)
and display a QR code in the terminal to scan to approve the login.

Outbound SSH to your tailnet
============================

reMarkable ships with Dropbear for SSH, which doesn't support anything like SOCKS proxying.
You'll need to install OpenSSH's client instead. Get it through Toltec with ``opkg install openssh-client``.

Tailscale has a basic built in "nc" which tunnels traffic over the tailnet.

The recommended way to configure this is via OpenSSH's `config files <https://www.ssh.com/academy/ssh/config#format-of-ssh-client-config-file-ssh_config>`_:

.. code-block:: console

  Host friendly-name
    User user
    HostName some-host.example.com
    Port 1234
    ProxyCommand /opt/bin/tailscale nc %h %p
