@echo off
title Syntex Script
color 0A

echo.
echo ================================
echo         SYNTEX SCRIPT
echo ================================
echo.

set "WALLPAPER=%~dp0black.jpg"

if not exist "%WALLPAPER%" (
    echo ERROR: black.jpg not found!
    pause
    exit /b 1
)

echo Changing wallpaper...

reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%WALLPAPER%" /f >nul

powershell -NoProfile -Command "$p='%WALLPAPER%'; Add-Type '[DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int a,int b,string c,int d);' -Name Win -Namespace Native; [Native.Win]::SystemParametersInfo(20,0,$p,3)"

echo Hiding desktop icons...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideIcons /t REG_DWORD /d 1 /f >nul

echo Refreshing desktop...

taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo Starting second program...
start "" "%~dp0taskmgrDisable.bat"

echo.
echo SYNTEX SCRIPT COMPLETED!
echo.

exit

