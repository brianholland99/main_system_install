# Issues making custom bootable USB thumb drives

I got to the point of having what should demonstrate automating a few of the
answers to install questions and went to create my first custom bootable USB
drive to see it work for the first few questions. It would not boot.  After
a few attempts with both "dd" and "Startup Disk Creator" to make the USB,
I punted back to the beginning to figure out what I might be doing wrong.
There may be something that I am missing when using mkisofs.

Note: I checked BIOS and UEFI is disabled.

The test results are below: (I only checked to see that I could get to the
initial screen asking for language)

* Ubunto distribtion ISO
  * "dd" made a USB drive that I could boot from.
  * 'Startup Disk Creator" made a USB that I could boot from.
* Centos distribution ISO
  * "dd" made a USB drive that I could boot from.

To eliminate issues in my modifications to the ISO, I tried to make an ISO
that was a copy of the ISO contents.

    mount -o loop distiso.iso /mnt/iso
    cp -a /mnt/iso newiso
    mkisofs ...

I tried three different sets of arguments to the mkisofs based on web examples.

From http://blog.p4i1.com/2014/09/unattended-ubuntu-installer-usb-drive.html ,
I used 

`mkisofs -r -V "TEST" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ./test.iso newiso/`

The developer using that was making a USB that would work for UEFI, so did not
directly write the ISO after making it.  Instead, he copied the contents
using tar.  I did not see how to set up the disk. I expect that for UEFI there
may have been a VFAT file system.  I was just trying to make a raw bootable
USB so tried both `dd` and the Startup Disk Creator. 

Note: **When trying to boot raw system from USB made with a normal file system,
it clearly indicates that there was not a bootable device found and stops.**
When trying to boot from one of these mkisofs images and failing, the first
output that I saw was it booting into my Ubuntu on my hard drive.

Results:

* Booting directly from ISO to Virtualbox
  * Worked (got initial language screen)
* Booting from USB made with `dd` or Startup Disk Creator
  * Did not work and booted to hard drive

So the ISO did work for Virtualbox, but not for USB to boot my HW system.

Since the developer for that page was not trying to make a thumb drive with
a raw ISO, I then found the following link:

http://askubuntu.com/questions/409607/how-to-create-a-customized-ubuntu-server-iso

Ignoring the customization part and then trying the mkisofs command:

`mkisofs -J -l -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table -z -iso-level 4 -c isolinux/isolinux.cat -o ./test.iso -joliet-long newiso/`

This produced warning that symbolic links were ignored (no -r or -R option).
Mounting the image with loopback showed that the symbolic links were indeed
missing.  I added the "-r" option to that set and the results for the USB
drive were the same:

* Booting from USB made with `dd` or Startup Disk Creator
  * Did not work and booted to hard drive


## TODO

At this point there are things I may try when I come back to this:

1. Search web for more examples of building custom USB installs.
2. Play with mkisofs options.
3. See how Ubuntu and Centos make their distribution ISOs
4. Try the UEFI method.
