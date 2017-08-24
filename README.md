Kickstart samples and How-To
=

Intro
-
Kickstart files are used to automate the installation of CentOS or RHEL, you can first install manually, and then anaconda (the Redhat installer) will create a file ``/root/anaconda-ks.cfg`` that you can use later to perform the same install.

> **Note:**
> The anaconda generated file ``anaconda-ks.cfg`` is generally directly usable to redo an installation.
> With Centos 6 and RHEL 6 you may need to comment out the ``repo --name="CentOS"...`` line if anaconda is not able to perform packages installation. Also on LVM based partitioning you may need to modify slightly the ``volgroup``, ``logvol`` and ``part`` statements.

Kickstart samples
-
This repository provides 2 samples of kicskstart files:
- One for CentOS 6 or RHEL 6
- One for Centos 7 or RHEL 7

They are very simple:
- basic server install
- automatic partitioning of the disk
- static IP address
- root user authentication with SSH keypair

So you just need to change the following parameters in the files:
 - IP address, network mask and gateway
 - hostname
 - SSH public key for root user authentication
 - root password, it is set to '``xxxxxxxx``' in the samples, **do not forget to change it**

How-to (global information)
-
You can use the kickstart file to automate the installation of CentOS or RHEL, the easier way is to install using a DVD (or a DVD image) and have the kicsktart file available on a Floppy (or a floppy image).

iLO cards on Hewlett Packard Enterprise (HPE) servers are able to mount a local directory of your computer and emulate a DVD, it is the best and easier way make the kickstart file available.

