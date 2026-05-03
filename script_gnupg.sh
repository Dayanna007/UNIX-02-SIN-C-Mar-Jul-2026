#
sudo apt update
#
sudo apt install -y git vim make gcc libncurses-dev flex bison bc \
cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86
#
git clone --depth 1 https://github.com/torvalds/linux.git
cd linux
#
make menuconfig
#
make -j 2
#
sudo mkdir /boot-files
sudo cp arch/x86/boot/bzImage /boot-files/
cd ..
#
git clone --depth 1 https://git.busybox.net/busybox
cd busybox
#
make menuconfig
#
make -j 2
sudo mkdir /boot-files/initramfs
sudo make CONFIG_PREFIX=/boot-files/initramfs install
#
cd /boot-files/initramfs
sudo vi init
#
sudo rm -f linuxrc
sudo chmod +x init
sudo find | cpio -o -H newc > ../init.cpio
cd ..
#
sudo su
dd if=/dev/zero of=boot bs=1M count=50
mkfs -t fat boot
syslinux boot
#
mkdir -p m
mount boot m
cp bzImage init.cpio m
umount m
#

