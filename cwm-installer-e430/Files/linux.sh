#!/bin/bash

echo "Unlock Bootloader & CWM Recovery"
echo "Recovery from PlayfulGod"
echo "Exploit & boot.img built by Cobmaster@xda"
echo "Thanks to IGGYVIP@xda for the idea of a aio tool"


sleep 3s


echo "Asking for root permission"
echo "             &              "
echo "Checking if device is online"
sudo chmod +x adb_linux
sudo chmod +x fastboot_linux
sudo ./adb_linux kill-server
sudo ./adb_linux wait-for-device

echo "Device found."

echo "Pushing unlocker to device"
echo "this will give you fastboot"
sudo ./adb_linux push unlocker.bin /sdcard/unlocker.bin
sudo ./adb_linux shell "su -c dd if=/sdcard/unlocker.bin of=dev/block/mmcblk0p5"
echo "Rebooting device in fastboot"
sudo ./adb_linux reboot bootloader
echo "Waiting for device to reboot"
sudo ./fastboot_linux devices

echo "Flashing new recovery"
sudo ./fastboot_linux flash recovery recovery.img
echo "Installing new boot.img"
sudo ./fastboot_linux flash boot boot.img
echo "Rebooting device again"
sudo ./fastboot_linux reboot
echo "Waiting for device to reboot"
sudo ./adb_linux wait-for-device
echo "Press Enter when the device is recognizedby your pc"
read enterKey 


echo "Rebooting in CWM"
sudo ./adb_linux reboot recovery
echo "Finished Recovery!!!"
echo "If I helped you press the thanks button!!!"


echo "Finished!! Your new system is ready!"

