@echo off

set "wallpaper=%~dp0black.jpg"

if not exist "%wallpaper%" (
    echo black.jpg not found!
    pause
    exit /b
)

powershell -NoProfile -Command "$p='%wallpaper%'; Add-Type '[DllImport(\"user32.dll\",SetLastError=true)] public static extern bool SystemParametersInfo(int a,int b,string c,int d);' -Name Win -Namespace Native; [Native.Win]::SystemParametersInfo(20,0,$p,3)"

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideIcons /t REG_DWORD /d 1 /f >nul

taskkill /f /im explorer.exe >nul
start explorer.exe

exit