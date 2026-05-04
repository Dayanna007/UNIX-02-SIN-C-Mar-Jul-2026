sudo apt update                                         # Updates the package list to ensure all software versions are current.
sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86 # Installs all required development tools and the QEMU emulator.
git clone --depth 1 https://github.com/torvalds/linux.git # Downloads the latest version of the Linux Kernel source code efficiently.
cd linux                                                # Enters the directory containing the Linux Kernel source files.
make menuconfig                                         # Opens a graphical interface to configure kernel features and drivers.
make -j 2                                               # Compiles the kernel source code using two CPU cores to speed up the process.
sudo mkdir /boot-files                                  # Creates a central directory to store the generated boot files.
sudo cp arch/x86/boot/bzImage /boot-files/              # Copies the compiled bootable kernel image to the storage folder.
cd ..                                                   # Returns to the previous parent directory.
git clone --depth 1 https://git.busybox.net/busybox     # Downloads the BusyBox source code to provide standard UNIX utilities.
cd busybox                                              # Enters the directory containing the BusyBox source files.
make menuconfig                                         # Opens the configuration menu for BusyBox settings and features.
make -j 2                                               # Compiles the BusyBox utilities using two CPU cores.
sudo mkdir /boot-files/initramfs                        # Creates a directory to build the temporary root filesystem.
sudo make CONFIG_PREFIX=/boot-files/initramfs install   # Installs the compiled BusyBox binaries into the initramfs folder.
cd /boot-files/initramfs                                # Enters the folder where the initial filesystem is being built.
sudo vi init                                            # Creates or edits the initial script that Linux runs during startup.
sudo rm -f linuxrc                                      # Removes the default symlink to avoid conflicts with the new init script.
sudo chmod +x init                                      # Grants execution permissions to the startup script.
sudo find . | cpio -o -H newc > ../init.cpio            # Archives the entire filesystem into a single CPIO file for the kernel.
cd ..                                                   # Returns to the boot-files directory.
sudo su                                                 # Switches the terminal session to the root user for administrative tasks.
dd if=/dev/zero of=boot bs=1M count=50                  # Creates an empty 50MB file to act as a virtual hard drive.
mkfs -t fat boot                                        # Formats the virtual drive with the FAT filesystem.
syslinux boot                                           # Installs the Syslinux bootloader onto the virtual drive.
mkdir m                                                 # Creates a temporary mount point directory.
mount boot m                                            # Attaches the virtual drive to the filesystem to copy files into it.
cp bzImage init.cpio m                                  # Copies the kernel and the filesystem into the virtual drive.
umount m                                                # Detaches the virtual drive safely to save changes.
exit                                                    # Exits the root user session and returns to the normal user.
sudo qemu-system-x86_64 -nographic -append "console=ttyS0 rdinit=/bin/sh" -kernel ./bzImage -initrd init.cpio # Starts the QEMU emulator to boot your custom Linux kernel.
ls                                                      # Lists all files and directories in the current location inside the emulated OS.
pwd                                                     # Displays the full path of the current working directory in the emulated OS.
vi bc                                                   # Opens the text editor to create or view a file named "bc".