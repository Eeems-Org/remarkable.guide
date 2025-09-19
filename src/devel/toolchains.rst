===================
Picking A Toolchain
===================

When building applications, you'll need a toolchain that allows you to cross compile for the device. There are several toolchains currently available.

.. contents:: Contents
   :local:
   :backlinks: none

- `Old Wiki Article <https://web.archive.org/web/20230129144348/https://remarkablewiki.com/devel/toolchain>`_

Official Toolchain
==================

reMarkable has provided, upon request, an official toolchain to the community. This toolchain is provided as-is to the community, and no official support is provided. The toolchain is meant to be installed on a linux machine.

Installer
---------

Over time the community has requested, and been provided with newer versions of the toolchain. It's always been provided as a self-extracting script.

- Official 1.8 toolchain installer
   - OS version: 2.5 and lower
   - `Mirror <https://ipfs.eeems.website/ipfs/QmZmt4UtvyLLA8mLde6WspqvhMAKjzfvJW91R3bEja6y3A>`__
   - sha256sum: ``6299955721bcd9bef92a87ad3cfe4d31df8e2da95b0c4b2cdded4431aa6748b0``
- Official 2.1.3 toolchain installer
   - OS version: Unknown
   - `Mirror <https://ipfs.eeems.website/ipfs/Qmdkdeh3bodwDLM9YvPrMoAi6dFYDDCodAnHvjG5voZxiC>`__
   - sha256sum: ``b44fef4e7c7abe1f6b08a1d3b552ee8122427ef85e7edea912a75a76edd910df``
- Official 3.1.2 toolchain installer
   - OS Version: 2.6 to 3.5
   - rM1:
      - `Direct Download <https://storage.googleapis.com/remarkable-codex-toolchain/codex-x86_64-cortexa9hf-neon-rm10x-toolchain-3.1.2.sh>`__
      - `Mirror <https://ipfs.eeems.website/ipfs/Qmbp5gkWAUr7DqVM6CGJm9U1qKHeeaz1QtYsQENE6PEgzQ>`__
      - sha256sum: ``da75ebb3451f5a2fd0e05eda6163f397551404200801fc7198e3e6f9cc8f710d``
   - rM2:
      - `Direct Download <https://storage.googleapis.com/remarkable-codex-toolchain/codex-x86_64-cortexa7hf-neon-rm11x-toolchain-3.1.2.sh>`__
      - `Mirror <https://ipfs.eeems.website/ipfs/QmU5H2Gmr9xqHAWAsFyWzWBpAHe7oWF6WBfYbK752H3CCM>`__
      - sha256sum: ``0ed50b016021e4c541af30cd564c4edfd92a48a6b066065634148f3ccca87aae``
- Official 3.1.15 toolchain installer
   - OS Version: 2.11 to 3.5
   - rM1:
      - `Direct Download <https://storage.googleapis.com/remarkable-codex-toolchain/codex-x86_64-cortexa9hf-neon-rm10x-toolchain-3.1.15.sh>`__
      - `Mirror <https://ipfs.eeems.website/ipfs/QmUZ6bunzbS1GDjHAyaz4zLGHg4kddE8oqpyG8uc4epyW3>`__
      - sha256sum: ``07cb35950a76b8b3d368252f633be5b7fd51540256e891941f6f409f158f4fc1``
   - rM2:
      - `Direct Download <https://storage.googleapis.com/remarkable-codex-toolchain/codex-x86_64-cortexa7hf-neon-rm11x-toolchain-3.1.15.sh>`__
      - `Mirror <https://ipfs.eeems.website/ipfs/Qmdw66tZo2ZPRqicK4dtiUUskdHnDFZNpRAKBS5iYKKDTw>`__
      - sha256sum: ``1a9a5b4f9bebb6798f890ad91bdba0eddc11e8afee18d5d79e40da193e66411f``
- Official 4.0.177 toolchain installer
   - OS Version: 3.6.0.1865 to 3.8.3.1976
   - rM1:
      - `Direct Download <https://storage.googleapis.com/remarkable-codex-toolchain/remarkable-platform-image-4.0.117-1-rm1-public-x86_64-toolchain.sh>`__
      - `Mirror <https://ipfs.eeems.website/ipfs/QmWD1Us3yTByABYNjP3rYhnZzYr3Lbp8roieBHLqAdt9J9>`__
      - sha256sum: ``52c3bec1b3cd744d39b2865d6f41d2edfaf337ae053acd48ee995c863a3afcc3``
   - rM2:
      - `Direct Download <https://storage.googleapis.com/remarkable-codex-toolchain/remarkable-platform-image-4.0.117-1-rm2-public-x86_64-toolchain.sh>`__
      - `Mirror <https://ipfs.eeems.website/ipfs/QmRvFmCe5evv8StwHANsq6xaGNiTEyGyL97ZoPzKCJzP9D>`__
      - sha256sum: ``780d5cc28eb555134d832f67121412232991d04eb44b586f70998d8da75a1533``
- Official 4.0.117-1 toolchain installer
   - OS Version: 3.6.1.1894 to 3.8.3.1976
   - rM1:
      - `Direct Download <https://storage.googleapis.com/remarkable-codex-toolchain/remarkable-platform-image-4.0.117-rm1-public-x86_64-toolchain.sh>`__
      - `Mirror <https://ipfs.eeems.website/ipfs/QmaxFeNZ7VoBgfjaB8LL3AFxsVViYeXFe86JhTbELJYf4m>`__
      - sha256sum: ``5ea2b8fe96e30604456c207c5dc4fe10ca8cdca664ab8cc241cc97f1028e7849``
   - rM2:
      - `Direct Download <https://storage.googleapis.com/remarkable-codex-toolchain/remarkable-platform-image-4.0.117-rm2-public-x86_64-toolchain.sh>`__
      - `Mirror <https://ipfs.eeems.website/ipfs/QmSDp52dwAoi4FTvHsZpjGuxLkLETTtVYu6kMdxQUiwJQu>`__
      - sha256sum: ``29779c80db2a025126d52faad88d553cadda09fff31fb4138a9df1d5b7e8a247``
- Official 4.0.258 toolchain installer
   - OS Version: 3.9.3.1986
   - rM1:
      - `Direct Download <https://storage.googleapis.com/remarkable-codex-toolchain/remarkable-platform-image-4.0.258-rm1-public-x86_64-toolchain.sh>`__
      - `Mirror <https://ipfs.eeems.website/ipfs/Qme2Hx8C5sYox4xzoJN9Jy2PCk4mEaGtbLHxFVTFTikC4E>`__
      - sha256sum: ``0b0112917ff5c06c3ce34e6b81d5c6edca772323d28eea0f2e19b76f9fcb943a``
   - rM2:
      - `Direct Download <https://storage.googleapis.com/remarkable-codex-toolchain/remarkable-platform-image-4.0.258-rm2-public-x86_64-toolchain.sh>`__
      - `Mirror <https://ipfs.eeems.website/ipfs/QmeFkFUgPsVGKHNvKo87nYGLp8tR8HujeVFTB8JB4TqbS6>`__
      - sha256sum: ``44717d3e14327b87bfd66fc61c3a7d585feafc91b639e43e31fbf3e1557f6bd1``
- Official 4.0.367 toolchain installer
   - OS Version: 3.9.4.2018 to 3.9.5.2026
   - rM1:
      - `Direct Download <https://storage.googleapis.com/remarkable-codex-toolchain/remarkable-platform-image-4.0.367-rm1-public-x86_64-toolchain.sh>`__
      - `Mirror <https://ipfs.eeems.website/ipfs/QmUVLbq949yAyqWSepzH7S1415kLFdLuR7qnNN7K6yX9Hv>`__
      - sha256sum: ``314d535ee8dfc7f7811969cd0c16c718e2f5caef6b74a64d18e6b0c97a253381``
   - rM2:
      - `Direct Download <https://storage.googleapis.com/remarkable-codex-toolchain/remarkable-platform-image-4.0.367-rm2-public-x86_64-toolchain.sh>`__
      - `Mirror <https://ipfs.eeems.website/ipfs/QmRS3fpSX9oeSZtEFhMs98XXdCKbLcByUYgeJU13dviskm>`__
      - sha256sum: ``43e9fb449b6e50fdff6b6110ea8fff167049b829628641537cb41738bd710eeb``
- Official 4.0.813 toolchain installer
   - OS Version: 3.14.1.10 to 3.14.3.0
   - rM Paper Pro:
      - `Direct Download <https://storage.googleapis.com/remarkable-codex-toolchain/3.14.3.0/meta-toolchain-remarkable-4.0.813-ferrari-public-x86_64-toolchain.sh>`__
      - `Mirror <https://ipfs.eeems.website/ipfs/QmQpagE9boGRLDv2iUuY9huxFZepDqivgb9uAW5BEArN1C>`__
      - sha256sum: ``29e2cce4280dbde182937c9614681a59a14aca8a18e06957bf66f8aeb0f3b968``
- For newer versions refer to the `reMarkable developer site <https://developer.remarkable.com/links#remarkable-software-development-kits>`__

After the toolchain has been installed, you'll need to source it to load the appropriate environment variables for its use.

.. code-block:: console

  $ source /opt/codex/rm11x/3.1.15/environment-setup-cortexa7hf-neon-remarkable-linux-gnueabi

Docker
------

If you are unable to develop on a linux machine, or would like to avoid installing the toolchain on your machine directly, you can use the `unofficial docker toolchain images <https://hub.docker.com/repository/docker/eeems/remarkable-toolchain>`_

.. code-block:: console

  $ docker pull eeems/remarkable-toolchain:3.1.15-rm2
  $ docker pull eeems/remarkable-toolchain:latest-rm2

You will still need to source the toolchain when running scripts inside the container to make sure it's loaded.

Toltec Toolchain
================

Toltec provides its own `toolchain in the form of docker images <https://github.com/toltec-dev/toolchain>`_. These can be used manually, but they are intended to be used in conjunction with the `toltecmk <https://pypi.org/project/toltecmk/>`_ tool to generate a toltec package.

.. code-block:: console

  $ docker pull ghcr.io/toltec-dev/toolchain:latest

Nix Toolchain
=============

There is a `nix toolchain <https://github.com/pl-semiotics/nix-remarkable>`_ available.

The ``zero-gravitas`` and ``zero-sugar`` platforms have been added to the nix upstream as well.
