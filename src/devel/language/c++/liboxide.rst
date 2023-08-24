========
Liboxide
========

Liboxide is the library that all the inernal applications for :ref:`oxide-launcher` use. It was built to simplify code sharing between these applications, but also grew to create simplified interfaces for various tasks required by applications on the device. It's largely assumed that appliations are built using the :doc:`qt` that use liboxide.

.. code-block:: console

  $ opkg install liboxide

Pros
====

- Provides APIs for interacting with xochitl settings.
- Provides APIs for interacting with Oxide.
- Can be updated without having to update all the applications that require it.

Cons
====

- Lots of external dependencies.
- Many portions depend on :ref:`oxide-launcher` being in use.
- Applications may break and require updates if there are breaking changes to the library.

External Links
==============

- Liboxide documentation
   https://oxide.eeems.codes/documentation/api/00_overview.html#liboxide-shared-library
