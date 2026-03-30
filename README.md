# LinuxDriveManager v1.0.0
## Introduction
LinuxDriveManager is a utility designed to help managing drives easier. It has features such as formatting, erasing/zeroing, etc.
## Usage
### List devices
Run ``sudo bash /path/to/the/driveman.sh``, then type in ``lsblk``. This will run your system's built-in block device reader.
### Erase drive
Run ``sudo bash /path/to/the/driveman.sh``, then type in ``erase``. It will ask you to confirm, twice. Then it will proceed to zero the device.
### Format drive
Run ``sudo bash /path/to/the/driveman.sh``, then type in ``formt``. This will ask you two things:
1. The filesystem needed
2. Confirmation (twice)

