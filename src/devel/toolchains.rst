===================
Picking A Toolchain
===================

When building applications, you'll need a toolchain that allows you to cross compile for the device. There are several toolchains currently available.

https://web.archive.org/web/20230129144348/https://remarkablewiki.com/devel/toolchain

Official Toolchain
==================

reMarkable has provided, upon request, an official toolchain to the community. This toolchain is provided as-is to the community, and no official support is provided. The toolchain is meant to be installed on a linux machine.

Installer
---------

Over time the community has requested, and been provided with newer versions of the toolchain. It's always been provided as a self-extracting script.

- Official 1.8 toolchain installer
   https://ipfs.eeems.website/ipfs/QmZmt4UtvyLLA8mLde6WspqvhMAKjzfvJW91R3bEja6y3A
   sha256sum: ``6299955721bcd9bef92a87ad3cfe4d31df8e2da95b0c4b2cdded4431aa6748b0``
   OS version: 2.5 and lower
- Official 2.1.3 toolchain installer
   https://ipfs.eeems.website/ipfs/Qmdkdeh3bodwDLM9YvPrMoAi6dFYDDCodAnHvjG5voZxiC
   sha256sum: ``b44fef4e7c7abe1f6b08a1d3b552ee8122427ef85e7edea912a75a76edd910df``
   OS version: Unknown
- Official 3.1.2 toolchain installer
   https://ipfs.eeems.website/ipfs/QmU5H2Gmr9xqHAWAsFyWzWBpAHe7oWF6WBfYbK752H3CCM
   sha256sum: ``0ed50b016021e4c541af30cd564c4edfd92a48a6b066065634148f3ccca87aae``
   OS Version: 2.6 and greater
- Official 3.1.15 toolchain installer
   https://ipfs.eeems.website/ipfs/Qmdw66tZo2ZPRqicK4dtiUUskdHnDFZNpRAKBS5iYKKDTw
   sha256sum: ``1a9a5b4f9bebb6798f890ad91bdba0eddc11e8afee18d5d79e40da193e66411f``
   OS Version: 2.11 and greater

After the toolchain has been installed, you'll need to source it to load the appropriate environment variables for it's use.

.. code-block:: console

  $ source /opt/codex/rm11x/3.1.15/environment-setup-cortexa7hf-neon-remarkable-linux-gnueabi

Docker
------

If you are unable to develop on a linux machine, or would like to avoid installing the toolchain on your machine directly, you can use the `unofficial docker toolchain images <https://hub.docker.com/repository/docker/eeems/remarkable-toolchain>`_

.. code-block:: console

  $ docker pull eeems/remarkable-toolchain:latest


You will still need to source the toolchain when running scripts inside the container to make sure it's loaded.

Toltec Toolchain
================

Toltec provides it's own `toolchain in the form of docker images <https://github.com/toltec-dev/toolchain>`_. These can be used manually, but they are indended to be used in conjunction with the `toltecmk <https://pypi.org/project/toltecmk/>`_ tool to generate a toltec package.

.. code-block:: console

  $ docker pull ghcr.io/toltec-dev/toolchain:latest

Nix Toolchain
=============

There is a `nix toolchain <https://github.com/pl-semiotics/nix-remarkable>`_ available.

The ``zero-gravitas`` and ``zero-sugar`` platforms have been added to the nix upstream as well.
