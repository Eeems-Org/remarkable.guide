========
Liboxide
========

Liboxide is a python library that wraps some of the command line tools for :ref:`oxide-launcher`.

.. code-block:: console

  $ pip install liboxide

Pros
====

- Much easier to work with in python than DBus or calling the command line tools manually.

Cons
====

- Depends on :ref:`oxide-launcher` being in use.
- Not asynchronous, which means that waiting on a signal blocks.

External Links
==============

- Repository
   https://github.com/Eeems-Org/python-liboxide
