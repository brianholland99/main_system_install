# Base Ubuntu Desktop Installation

## Overview

Current install is normal install of Ubuntu 18.04 Desktop ISO.
Most of the defaults work for me. I indicate the choices
I made during the install and is notated by the information after the
'==>'.

For partitioning, I did not use gudided as I have two disks and wanted
/home on the 2nd disk.  I will eventually look at using one or both of the
automated configuration methods to do the below.  It is only in description
at this moment.  This is the only OS on the system as I will be using
Virtual box for installing other OSs, so I am OK with GRUB on the MBR.

Note: I got a new monitor (31.5" 4K connected with DP) after previously
installing Ubuntu 17.10 and adding the NVIDIA driver. The install of 18.04 was
the first since the new monitor. The DisplayPort does not work for boot/install
with my setup (Dual NVIDIA GTX 550 Ti cards and 31.5" 4K monitor). Also, I needed
the NVIDIA drivers before my DP-connected 4K monitor seems to work even after
install. Step 2 below has that driver installed during the Ubuntu install now.

(Booting on a newer box with NVIDIA GTX 1080 Ti seems to boot fine to my new
monitor using DP. Not sure if newer Video firmware or settings, so this may
be easier for that one.)

## Instructions

Connect DVI monitor for install.  

Boot system from the USB ISO and then follow the steps below:

1. Keyboard Layout -> English (US) / English (US)

   ==> [enter]

2. Updates and other software -> Normal installation / Download updates
   while installing Ubuntu are enabled
  
   ==> Enable "Install third-party software for graphics and Wi-Fi hardware
   and addtional media formats" then hit [enter]

3. Some option will be default based on what OS's are there.
   One of these options may have worked and left 2nd disk
   as is and mounted on same points after they had been set up
   previously.  Chose the option that appeared to give me control.
   The one that included LVM may have done the right thing, but
   this worked for me. I wasn't going to chance it and then
   have to restore 2nd disk from backups.

   ==> Select "Something Else" and hit [enter]

4. Partitioning method: [I have two disks so set up the following:]
  1. Disk 1 - 120 GB SSD
    1. 2 GB primary ext4 /boot (bootable) - format
    2. 118 GB logical ext4 / - format
  2. Disk 2 - 2 TB
    1. LVM VG ubuntu 500 GB - set to ext4 /home -
       format - first time.  Varies after that.
       To get a clean home directory, they can be
       copied to /m and choosing to format /home.
       That allows comparing to see differences in
       default configuration and also the
       ability to restore data files.
    2. LVM VG ubuntu 1500 GB - set to ext4 /m -
       format (first time - keep date for reinstalls)
  3. Device for boot loader installation - /dev/sda
  
   ==> Click "Install Now"
   
5. Write the changes to disks?

   ==> Click "Continue"

6. Where are you? New York

   ==> Click "Continue"

7. Your name: ==> Brian Holland
   Your computer's name: ==> bhdesk
   Pick a user name: brian
   Choose a password: ==> ...
   Confirm your password: ==> ...
   Require my password to log in (selected)
   
   ==> Click "Continue"

8. Installation is complete ...

   ==> Remove USB and Click "Restart Now"

9. Please remove the installation medium, the reboot.

   ==> Reboot via power switch.

10. The NVIDIA drivers were still not active.

   ==> Log in. Type "ubuntu-drivers devices". It should
   show at least one NVIDIA driver with recommended next
   to it. To install that one, type "sudo -i ubuntu-drivers
   autoinstall".

11. Turn off Wi-Fi.

    ==> Settings -> Wi-Fi - Click to change from ON to OFF.

12. ==> Power Off via menu

13. ==> Disconnect DVI monitor and connect DP monitor.

14. ==> Boot

