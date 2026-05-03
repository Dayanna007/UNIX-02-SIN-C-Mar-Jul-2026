#!/bin/bash
# Script para compilar la distro basada en "my_own_little_distro (1).pdf"

echo "--- PASO 2: Instalando dependencias ---"
sudo apt update
sudo apt install -y git vim make gcc libncurses-dev flex bison bc \
cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86

echo "--- PASO 3: Compilando el kernel Linux ---"
git clone --depth 1 https://github.com/torvalds/linux.git
cd linux
make menuconfig[cite: 1]
make -j 2[cite: 1]
sudo mkdir -p /boot-files
sudo cp arch/x86/boot/bzImage /boot-files/
cd ..

echo "--- PASO 4: Compilando BusyBox ---"
git clone --depth 1 https://git.busybox.net/busybox
cd busybox
make menuconfig[cite: 1]
make -j 2[cite: 1]
sudo mkdir -p /boot-files/initramfs
sudo make CONFIG_PREFIX=/boot-files/initramfs install[cite: 1]
cd ..

echo "--- PASO 5: Creando el initramfs ---"
cd /boot-files/initramfs
sudo bash -c 'cat <<EOF > init
#!/bin/sh
/bin/sh
EOF'
sudo chmod +x init[cite: 1]
sudo find | cpio -o -H newc > /boot-files/init.cpio[cite: 1]

echo "--- PASO 6: Creando la imagen de boot ---"
cd /boot-files
sudo dd if=/dev/zero of=boot bs=1M count=50[cite: 1]
sudo mkfs -t fat boot[cite: 1]
sudo syslinux boot[cite: 1]
sudo mkdir -p m
sudo mount boot m
sudo cp bzImage init.cpio m[cite: 1]
sudo umount m

echo "PROCESO FINALIZADO."
