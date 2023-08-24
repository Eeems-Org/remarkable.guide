=================
Transfering Files
=================

.. raw:: html

  <div class="warning">
    ⚠️ Try to keep your files inside /home/root ⚠️
    <p>
      The root partition is completely replaced on os upgrade, which means any modifications will be lost.
    </p>
    <p>
      Because you have root access to the device, you can modify any system file you which. This does mean that you can soft-brick your device if you are not careful.
    </p>
  </div>

Since you have :doc:`ssh` to your device, there are various tools you can use to transfer files to and from the device. This is not the same as transferring documents to xochitl, as this is accessing the OS filesystem. This lets you modify system files. For example, you can use this to change templates and the suspend screen.

.. contents:: Contents
   :local:
   :backlinks: none

Command Line
============

OpenSSH
-------

If you have OpenSSH installed, you can use `scp <https://www.man7.org/linux/man-pages/man1/scp.1.html>`_ from the command line to copy files to and from the device:

.. code-block:: shell

  scp ./file.txt root@10.11.99.1:/home/root/file.txt
  scp root@10.11.99.1:/home/root/file.txt ./file.txt

You can also use `sftp <https://www.man7.org/linux/man-pages/man1/sftp.1.html>`_ from the command line to copy files to and from the device:

.. code-block:: shell

  echo put file.txt | sftp root@10.11.99.1
  echo get file.txt | sftp root@10.11.99.1

PuTTY
-----

If you are using PuTTY you can use `pscp <https://the.earth.li/~sgtatham/putty/0.78/htmldoc/Chapter5.html#pscp>`_ or `psftp <https://the.earth.li/~sgtatham/putty/0.78/htmldoc/Chapter6.html#psftp>`_ to transfer files instead.

GUI Tools
=========

If you would like to have a graphical user interface for transferring files, there are many options out there. Below are some recommendations that we have, but you are not limited to only using these options.

- `WinSCP <https://winscp.net/eng/index.php>`_ is a very versatile SFTP/SCP client for windows that has drag and drop integration with the windows file explorer.

- `FileZilla <https://filezilla-project.org/>`_ is a sftp client that is available for MacOS, Windows, and Linux.

- `Cyberduck <https://cyberduck.io/>`_ is a SFTP client for MacOS and Windows.

External Links
==============

- ``scp`` command
   https://www.man7.org/linux/man-pages/man1/scp.1.html
- ``sftp`` command
   https://www.man7.org/linux/man-pages/man1/sftp.1.html
- ``pscp`` command
   https://the.earth.li/~sgtatham/putty/0.78/htmldoc/Chapter5.html#pscp
- ``psftp`` command
    https://the.earth.li/~sgtatham/putty/0.78/htmldoc/Chapter6.html#psftp
