@echo off
title Build all pkgs for Vision
color a
cls
cd %~dp0
net session >nul 2>nul
net session >nul 2>nul
IF %errorlevel% == 0 (
echo The directory is: %~dp0. Correct? If so, follow the instructions below and press any key to continue.
pause
) else (
echo Oops! You need to run this script in an elevated prompt. Reopen the script with admin privileges, then try again.
pause
exit
)
cls
start cmd /c npx electron-packager . --platform=darwin --arch=x64 --out=.\dist
start cmd /c npx electron-packager . --platform=linux --arch=x64 --out=.\dist
start cmd /c npx electron-packager . --platform=linux --arch=armv7l --out=.\dist
start cmd /c npx electron-packager . --platform=linux --arch=arm64 --out=.\dist
start cmd /c npx electron-builder build --win -p always
cd %~dp0
timeout /t 70 /nobreak
cls
powershell -command compress-archive -path '%CD%\dist\visionbrowser-darwin-x64' -destinationpath '%CD%\dist\visionbrowser-darwin-x64.zip'
powershell -command compress-archive -path '%CD%\dist\visionbrowser-linux-x64' -destinationpath '%CD%\dist\visionbrowser-linux-x64.zip'
powershell -command compress-archive -path '%CD%\dist\visionbrowser-linux-arm64' -destinationpath '%CD%\dist\visionbrowser-linux-arm64.zip'
powershell -command compress-archive -path '%CD%\dist\visionbrowser-linux-armv7l' -destinationpath '%CD%\dist\visionbrowser-linux-armv7l.zip'