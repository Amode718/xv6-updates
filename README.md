# xv6-mversion
The purpose of this fork of xv6 (the x86 version) was to update some of the features in the abandoned version in order to match with the currently maintained version (the riscv version). So far this has consisted of some tweaks to the makefile and other files in order to get the file structure right, changes to the make file to allow compilation on the latest binutils and gcc packages, and a shutdown command to make it easier to quit the xv6 session.

## Installation of dependencies
### Ubunutu (and Ubuntu WSL)
Install the following packages using the following commands:
`sudo apt install git nasm build-essential qemu-system gdb`

### Arch linux
FIXME: add commands for pacman for the arch folk.

## Running the OS
From the command line, run the following command `make qemu-nox`. This command will run qemu in the command line rather than a graphical enviroment. If you want the graphical enviroment for the VM, run `make qemu`. You may also need to use "export TOOLPREFIX="x86_64-elf-" to get the correct toolchain."

## Shutting Down the OS
There are two ways of closing the emulator. One way is by shutting down the OS that is being emulate . Use the command `shutdown` or `shutdown -now` to shutdown xv6 or if xv6 is not responding, use the `CTRL+A+X` keyboard shortcut to kill the VM.
# xv6-updates
