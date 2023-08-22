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
You'll also want to set up systemd to manage running ``tailscaled``.
Save this to ``/lib/systemd/system/tailscaled.service``:

.. code-block:: ini

 [Unit]
 Description=Tailscale node agent
 Documentation=https://tailscale.com/kb/
 Wants=network-pre.target
 After=network-pre.target

 [Service]
 Environment="HOME=/home/root"
 ExecStartPre=/opt/bin/tailscaled --cleanup
 ExecStart=/opt/bin/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/run/tailscale/tailscaled.sock --tun=userspace-networking --socks5-server=localhost:1055 --outbound-http-proxy-listen=localhost:1055
 ExecStopPost=/opt/bin/tailscaled --cleanup

 Restart=on-failure

 RuntimeDirectory=tailscale
 RuntimeDirectoryMode=0755
 StateDirectory=tailscale
 StateDirectoryMode=0700
 CacheDirectory=tailscale
 CacheDirectoryMode=0750
 Type=notify

 [Install]
 WantedBy=multi-user.target

Since you're working on a device that doesn't support ``tun``, you're specifying that you're using userspace networking.
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

Next, you'll need something to handle the proxying.
Your system `nc` is from Busybox, which is too stripped down for what we need here, so get ``ncat`` with ``opkg install ncat``.

You'll then need to configure OpenSSH to use ``ncat`` to use the proxy you asked ``tailscaled`` to set up.
If you want to set this up nicely, you can `work with OpenSSH's config files <https://www.ssh.com/academy/ssh/config#format-of-ssh-client-config-file-ssh_config>`_
to use the proxy for whatever situation you care about.

This author was too lazy to try to do that as of this initial draft, and instead used an alias for this command to get the job done:

``/opt/libexec/ssh-openssh user@host -o ProxyCommand='ncat --proxy-type socks5 --proxy 127.0.0.1:1055 %h %p'``

You should be able to use the device name in your tailnet for the host: give that a shot and see if your connection works!

