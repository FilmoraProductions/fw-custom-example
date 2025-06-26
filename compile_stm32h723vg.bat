@echo off
cd /d %~dp0\..\..
echo Compilando rusEFI para STM32H723VG...
gradlew.bat buildFirmwareBoard -Pboard=stm32h723vg
pause
