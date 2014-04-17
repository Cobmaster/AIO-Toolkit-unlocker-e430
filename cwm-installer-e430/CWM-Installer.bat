@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

echo "Unlock Bootloader & CWM Recovery"
echo "Recovery from PlayfulGod"
echo "Exploit & boot.img built by Cobmaster@xda"
echo "Thanks to IGGYVIP@xda for the idea of an aio tool for our device"

pause
Files\adb kill-server
Files\adb wait-for-device

echo Device found.

echo Pushing unlocker to device
echo this will give you fastboot
Files\adb push Files\unlocker.bin /sdcard/unlocker.bin
Files\adb shell "dd if=/sdcard/unlocker.bin of=/dev/block/mmcblk0p5"
echo Rebooting device into fastboot
Files\adb reboot bootloader
echo Waiting for device to reboot
echo wait until windows recognizes your device
pause
Files\fastboot flash recovery Files\recovery.img

Files\fastboot flash boot Files\boot.img

echo Finished Recovery and bootloader
echo If I helped you press the thanks button!!!
Files\fastboot reboot

pause
exit
