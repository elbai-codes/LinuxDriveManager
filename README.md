# LinuxDriveManager v1.0.0
Drives Easier for Linux Noobs
## Introduction
LinuxDriveManager is a utility designed to help managing drives easier. It has features such as formatting, erasing/zeroing, etc.
## Usage
### List devices
Run ``sudo bash /path/to/the/driveman.sh``, then type in ``lsblk``. This will run your system's built-in block device reader.
### Erase drive
Run ``sudo bash /path/to/the/driveman.sh``, then type in ``erase``, and then a device name. It will ask you to confirm, twice. Then it will proceed to zero.
### Format drive
Run ``sudo bash /path/to/the/driveman.sh``, then type in ``formt``, and then a device name. This will ask you two things:
1. The filesystem needed
2. Confirmation (twice)  

Warning! This action requires MKFS to function.
### Filesystem Integrity Check
Run ``sudo bash /path/to/the/driveman.sh``, then type in ``fsint``. This will ask you one thing:
1. Which device? 

Then it will perform a full drive check.
### Mount
Run ``sudo bash /path/to/the/driveman.sh``, then type in ``mount``, then input the drivename, and then input the mountpoint.
### Unmount
Run ``sudo bash /path/to/the/driveman.sh``, then type in ``umont``. This will ask you the drive to unmount.

___  
Happy LinuxDriveManaging!
