=====================
Github Best Practices
=====================

The community has several best practices for remarkable related github repositories. We would like to request that when you host a repository on github or elsewhere you follow them where applicable.

remarkable-tablet topic
=======================

In order to make new repositories more discoverable, they should be added to the `remarkable-tablet <https://github.com/topics/remarkable-tablet>`_ topic.

License
=======

In order to make it clear what users are allowed to do with a project/application, a license needs to be added to the repository. See `Licensing a repository <https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository>`_ for more information on picking a license, and adding it to your repository.

Github Actions
==============

In order to reduce friction for users who want to use your application, it's best to include automated builds using github actions. Our recommendation would be to use toltecmk to :doc:`build a toltec package <package>`, and include it as a release artifact.

If you are writing your own action meant to assist with developing applications for the reMarkable tablet, please include the `action <https://github.com/topics/action>`_ and `remarkable-tablet <https://github.com/topics/remarkable-tablet>`_ topics to your repository. Users can then easily find all the available github actions with with `a simple search <https://github.com/search?q=topic%3Aaction+topic%3Aremarkable-tablet&type=repositories>`_.

Badges
======

There are various badges that the community uses to make it easier for users, at a glance, to understand the state of the application(s) in a repository.

reMarkable 1 support
--------------------

This badge is used to indicate that the application supports the reMarkable 1 tablet.

.. image:: https://img.shields.io/badge/rM1-supported-green
  :alt: rM1 supported
  :target: https://remarkable.com/store/remarkable

.. code-block:: markdown

  [![rm1](https://img.shields.io/badge/rM1-supported-green)](https://remarkable.com/store/remarkable)

reMarkable 2 support
--------------------

This badge is used to indicate that the application supports the reMarkable 2 tablet.

.. image:: https://img.shields.io/badge/rM2-supported-green
  :alt: rM2 supported
  :target: https://remarkable.com/store/remarkable

.. code-block:: markdown

  [![rm2](https://img.shields.io/badge/rM2-supported-green)](https://remarkable.com/store/remarkable-2)

Toltec package name
-------------------

This badge is used to indicate what the package name is in toltec, so users know at a glance what to install.

.. image:: https://img.shields.io/badge/OPKG-oxide-blue
  :alt: rM2 supported
  :target: https://toltec-dev.org/

Replace ``<name`` with the name of the package in toltec.

.. code-block:: markdown

  [![opkg](https://img.shields.io/badge/OPKG-<name>-blue)](https://toltec-dev.org/)

Community Discord
-----------------

This badge is used to help grow the community, by making sure they know how to access the community discord. This allows people to get quicker help when they have questions they need answered.

.. image:: https://img.shields.io/discord/385916768696139794.svg?label=reMarkable&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2
  :target: https://discord.gg/ATqQGfu

.. code-block:: markdown

  [![Discord](https://img.shields.io/discord/385916768696139794.svg?label=reMarkable&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://discord.gg/ATqQGfu)
