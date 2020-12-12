@echo off
title Build all pkgs for Vision
color a
cls
cd %~dp0
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------   
echo The directory is: %~dp0. Correct? If so, follow the instructions below and press any key to continue.
pause
cls
start cmd /c npx electron-packager . --platform=darwin --arch=x64 --out=.\dist
start cmd /c npx electron-packager . --platform=linux --arch=x64 --out=.\dist
start cmd /c npx electron-packager . --platform=linux --arch=armv7l --out=.\dist
start cmd /c npx electron-packager . --platform=linux --arch=arm64 --out=.\dist
start cmd /c npx electron-builder build --win -p always
cd %~dp0