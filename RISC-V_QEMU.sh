#!bin/sh

# Обновление системы и установка необходимых пакетов
apt-get update
apt-get install qemu-system-riscv64 opensbi qemu-system-misc u-boot-qemu wget libguestfs-tools -y

# Скачивание образа ОС и разархивирование
wget https://cdimage.ubuntu.com/releases/24.04/release/ubuntu-24.04.1-preinstalled-server-riscv64.img.xz
xz -dk ubuntu-24.04.1-preinstalled-server-riscv64.img.xz

# Изменение размера образа ОС
qemu-img resize -f raw ubuntu-24.04.1-preinstalled-server-riscv64.img $3

# Установка пароля
virt-customize -a ubuntu-24.04.1-preinstalled-server-riscv64.img --root-password password:$4 || sleep 10m

# Запуск QEMU
qemu-system-riscv64 -machine virt -nographic -m $2 -smp $1 -bios /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.bin -kernel /usr/lib/u-boot/qemu-riscv64_smode/uboot.elf -device virtio-net-device,netdev=eth0 -netdev user,id=eth0 -device virtio-rng-pci -drive file=ubuntu-24.04.1-preinstalled-server-riscv64.img,format=raw,if=virtio
