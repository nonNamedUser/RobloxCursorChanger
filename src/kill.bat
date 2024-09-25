@echo off

tasklist /FI "IMAGENAME eq RobloxPlayerBeta.exe" | find /I "RobloxPlayerBeta.exe" >nul
if %errorlevel%==0 (
    taskkill /F /IM "RobloxPlayerBeta.exe"
)

tasklist /FI "IMAGENAME eq RobloxPlayer.exe" | find /I "RobloxPlayer.exe" >nul
if %errorlevel%==0 (
    taskkill /F /IM "RobloxPlayer.exe"
)