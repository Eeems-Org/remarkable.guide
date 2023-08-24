======
Python
======

Python is available as a toltec package. Due to the package build built using the entware toolchain, it is not compatible with the native libraries, or any packages built with the toltec toolchain. This means that it can't interface with the :ref:`rm2fb` server directly. Instead you can use :doc:`../shell/simple` to interact with the screen.

.. code-block:: shell

  opkg install python3

Pip is also available as a package, and can be used to install python libraries that are not available as packages:

.. code-block:: shell

  opkg install python3-pip

Pros
====

- Large existing ecosystem can be leveraged.

Cons
====

- JIT compiled language has higher overhead than other languages.

Further Reading
===============

.. toctree::
    :titlesonly:
    :glob:

    *
    Old Wiki Article <https://web.archive.org/web/20230129163927/https://remarkablewiki.com/devel/python>

