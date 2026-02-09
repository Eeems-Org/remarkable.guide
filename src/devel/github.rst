=====================
Github Best Practices
=====================

The community has several best practices for reMarkable related github repositories. These guidelines make it easier for users to discover software and contribute back to the community.

remarkable-tablet topic
=======================

In order to make new repositories more discoverable, they should be added to the `remarkable-tablet <https://github.com/topics/remarkable-tablet>`_ topic.

License
=======

In order to make it clear what users are allowed to do with a project/application, a license should be added to the repository. See `Licensing a repository <https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository>`_ for more information on picking a license, and adding it to your repository.
 
Badges
======

Badges make it easier for users to understand the state of the application(s) in a repository.

reMarkable 1 support
--------------------

This badge is used to indicate that the application supports the reMarkable 1 tablet.

.. image:: https://img.shields.io/badge/rM1-supported-green
  :alt: rM1 supported
  :target: https://remarkable.com/products/remarkable-1

.. code-block:: markdown

  [![rm1](https://img.shields.io/badge/rM1-supported-green)](https://remarkable.com/products/remarkable-1)

reMarkable 2 support
--------------------

This badge is used to indicate that the application supports the reMarkable 2 tablet.

.. image:: https://img.shields.io/badge/rM2-supported-green
  :alt: rM2 supported
  :target: https://remarkable.com/products/remarkable-2

.. code-block:: markdown

  [![rm2](https://img.shields.io/badge/rM2-supported-green)](https://remarkable.com/products/remarkable-2)

reMarkable Paper Pro support
----------------------------

This badge is used to indicate that the application supports the reMarkable Paper Pro tablet.

.. image:: https://img.shields.io/badge/rMPP-supported-green
  :alt: rMPP supported
  :target: https://remarkable.com/products/remarkable-paper/pro

.. code-block:: markdown

  [![rmpp](https://img.shields.io/badge/rMPP-supported-green)](https://remarkable.com/products/remarkable-paper/pro)

reMarkable Paper Pro Move support
---------------------------------

This badge is used to indicate that the application supports the reMarkable Paper Pro Move tablet.

.. image:: https://img.shields.io/badge/rMPPM-supported-green
  :alt: rMPPM supported
  :target: https://remarkable.com/products/remarkable-paper/pro-move

.. code-block:: markdown

  [![rmppm](https://img.shields.io/badge/rMPPM-supported-green)](https://remarkable.com/products/remarkable-paper/pro-move)

Toltec package name
-------------------

This badge is used to indicate what the package name is in :doc:`../../guide/software/toltec`, so users know at a glance what to install.

.. image:: https://img.shields.io/badge/OPKG-oxide-blue
  :alt: Toltec package: oxide
  :target: https://toltec-dev.org/

Replace ``<name>`` with the name of the package in :doc:`../../guide/software/toltec`.

.. code-block:: markdown

  [![opkg](https://img.shields.io/badge/OPKG-<name>-blue)](https://toltec-dev.org/)

Vellum package name
-------------------

This badge is used to indicate what the package name is in vellum, so users know at a glance what to install.

.. image:: https://img.shields.io/badge/vellum-xovi-purple
  :alt: vellum package: xovi
  :target: https://vellum.delivery/

Replace ``<name>`` with the name of the package in vellum.

.. code-block:: markdown

  [![opkg](https://img.shields.io/badge/vellum-<name>-purple)](https://vellum.delivery/)

Community Discord
-----------------

This badge is used to help grow the community, by making sure they know how to access the community discord. This allows people to get quicker help when they have questions they need answered.

.. image:: https://img.shields.io/discord/385916768696139794.svg?label=reMarkable&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2
  :target: https://discord.gg/ATqQGfu

.. code-block:: markdown

  [![Discord](https://img.shields.io/discord/385916768696139794.svg?label=reMarkable&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://discord.gg/ATqQGfu)

Github Actions
==============

In order to reduce friction for users who want to use your application, it's best to include automated builds using github actions. Our recommendation would be to use toltecmk to :doc:`build a toltec package <package>`, and include it as a release artifact.

If you are writing your own action meant to assist with developing applications for the reMarkable tablet, please include the `action <https://github.com/topics/action>`_ and `remarkable-tablet <https://github.com/topics/remarkable-tablet>`_ topics to your repository. Users can then easily find all the available github actions with with `a simple search <https://github.com/search?q=topic%3Aaction+topic%3Aremarkable-tablet&type=repositories>`_.
