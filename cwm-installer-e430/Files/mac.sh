#!/bin/bash

echo "Unlock Bootloader & CWM Recovery"
echo "Recovery from PlayfulGod"
echo "Exploit & boot.img built by Cobmaster@xda"
echo "Thanks to IGGYVIP@xda for the idea of a aio tool"


sleep 3s


echo "Asking for root permission"
echo "             &              "
echo "Checking if device is online"
sudo chmod +x adb_mac
sudo chmod +x fastboot_mac
sudo ./adb_mac kill-server
sudo ./adb_mac wait-for-device

echo "Device found."

echo "Pushing unlocker to device"
echo "this will give you fastboot"
sudo ./adb_mac push unlocker.bin /sdcard/unlocker.bin
sudo ./adb_mac shell "su -c dd if=/sdcard/unlocker.bin of=dev/block/mmcblk0p5"
echo "Rebooting device in fastboot"
sudo ./adb_mac reboot bootloader
echo "Waiting for device to reboot"
sudo ./fastboot_mac devices

echo "Flashing new recovery"
sudo ./fastboot_mac flash recovery recovery.img
echo "Installing new boot.img"
sudo ./fastboot_mac flash boot boot.img
echo "Rebooting device again"
sudo ./fastboot_mac reboot
echo "Waiting for device to reboot"
echo "Press Enter when device is online and recognized"
read enterKey 

echo "Rebooting in CWM"
sudo ./adb_mac reboot recovery
echo "Finished Recovery!!!"
echo "If I helped you press the thanks button!!!"


echo "Finished!! Your new system is ready!"

