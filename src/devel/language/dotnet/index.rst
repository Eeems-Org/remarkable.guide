====
.NET
====

Due to the cross platform nature of modern .NET, no porting was required to get it working on the device. The runtime is available as a package in :doc:`../../../guide/software/toltec/toltec`.

.. code-block:: console

  $ opkg install dotnet-sdk

Pros
====

- .NET has a large existing ecosystem that can be leveraged.

Cons
====

- .NET has a higher resource footprint than other languages.
- Large amount of disk space is required for the dotnet runtime.
- Only one UI framework is currently available.

Further Reading
===============

.. toctree::
    :titlesonly:
    :glob:

    *
