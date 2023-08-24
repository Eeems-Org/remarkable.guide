=======
Node.js
=======

Node.js is available through toltec. Due to the package build built using the entware toolchain, it is not compatible with the native libraries, or any packages built with the toltec toolchain. This means that it can't interface with the :ref:`rm2fb` server directly. Instead you can use :doc:`../shell/simple` to interact with the screen.

.. code-block:: shell

  opkg install nodejs

Pros
====

- Large existing ecosystem can be leveraged.

Cons
====

- Larger memory footprint than other languages.
- JIT compiled language has higher overhead than other languages.

Further Reading
===============

.. toctree::
    :titlesonly:
    :glob:

    *
