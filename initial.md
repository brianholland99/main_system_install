# Base Ubuntu Server Installation

## Overview

The Ubuntu install is a minimal install from the Ubuntu 16.04 server ISO and
is straightforward. Most of the defaults work for me. I detail the choices
I made during the install and is indicated by the square brackets.

For partitioning, I did not use gudided as I have two disks and wanted
/home on the 2nd disk.  I will eventually look at using one or both of the
automated configuration methods to do the below.  It is only in description
at this moment.  I was using a USB drive for the ISO image and I did not want
to play with putting the configs on that and did not play with mounting a
separate device.  This is the only OS on the system as I will be using
Virtual box for installing other OSs, so I am OK with GRUB on the MBR.

## Instructions

Boot system from the USB ISO and then follow the steps below:

1. Language -> English - [enter]
2. Install Ubuntu Server - [enter]
3. Language -> English - English [enter]
4. Country, territory or area: United States [enter]
5. Detect keyboard layout? No [Enter]
6. Country of origin for the keyboard: Engish (US) [enter]
7. Keyboard layout: English (US) [enter]
8. Primary network interface: eno1 [select "eno2"; enter]
9. Hostname: ubuntu [delete "ubuntu"; type "bhdesk"; enter]
10. Full name for the new user: [type "Brian Holland"; enter]
11. Username for your account: brian [enter]
12. Choose a password for the new user: [... ; enter]
13. Re-enter password to verify: [... ; enter]
14. Encrypt your home directory? No [enter]
15. ... America/New_York. ... Is this time zone correct? Yes [enter]
16. Unmount partitions that are in use? No [select "Yes"; enter]
17. Partitioning method: [I have two disks so set up the following:]
  1. Disk 1 - 120 GB SSD
    1. 200 MB primary ext4 /boot (bootable) - format
    2. 107 GB logical ext4 / - format
    3. 17 GB logical swap swap - format
  2. Disk 2 - 2 TB
    1. LVM VG ubuntu 500 GB - set to ext4 /home -
       format (first time - keep data for reinstalls)
  3. [select "Finish partitioning and write changes to disk"; enter]
18. Write the changes to disks? No [select "Yes"; enter]
19. HTTP proxy information (blank for none): [enter]
20. How do you want to manage upgrades on this system?
    No automatic updates [enter]
21. Choose software to install: (Only "standard system utilties" was
    selected by default.) [enter]
22. Install the GRUB boot loader to the master boot record? Yes [enter]
23. Device for the boot loader installation: Enter device manually
    [select "/dev/sda"; enter]
24. Installation is complete ... remove installation media ... <Continue>
    [remove media; enter]
