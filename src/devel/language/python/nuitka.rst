======
Nuitka
======

Nuitka is the optimizing Python compiler written in Python that creates executables that run without an need for a separate installer.

.. code-block:: console

  $ sh -c "$(wget https://raw.githubusercontent.com/Eeems-Org/remarkable-debian-chroot/master/install.sh -O-)"
  $ export PATH=~/.local/bin:$PATH
  $ debian-chroot bash -x <<'EOF'
    set -e
    apt install -y \
      python3-dev \
      libffi-dev \
      python3-pip \
      python3-venv \
      patchelf \
      ccache
    python3 -m venv /opt/lib/nuitka
    source /opt/lib/nuitka/bin/activate
    pip install nuitka
  EOF

.. code-block:: console

  $ export PATH=~/.local/bin:$PATH
  $ debian-chroot bash -x <<'EOF'
    set -e
    source /opt/lib/nuitka/bin/activate
    echo 'print("Hello World!")' > hello.py
    nuitka3 --onefile hello.py
    ./hello.bin
  EOF

Pros
====

- Less space required than running python with the normal interpreter.
- Compiled executables that do not require python to be installed.
- Faster than JIT python scripts.

Cons
====

- Doing development on device will require a debian chroot.
- Can be difficult to iterate if you use pip packages that are not compatible with the version of python installed with pip.

External Links
==============

- Homepage
   https://nuitka.net/
- Github Action to automate compilation
   https://github.com/marketplace/actions/remarkable-nuitka-build-action
- Script for setting up debian chroot
   https://github.com/Eeems-Org/remarkable-debian-chroot
