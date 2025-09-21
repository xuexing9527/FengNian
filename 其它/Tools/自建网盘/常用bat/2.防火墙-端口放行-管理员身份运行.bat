@echo off
title Firewall Port Manager
color 0A

:: -----------------------
:: Check for admin
:: -----------------------
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo You must run this script as Administrator!
    pause
    exit
)

:menu
cls
echo.
echo ================================
echo   Firewall Port Manager
echo.
echo   1. Allow a port
echo   2. Remove a port
echo   3. Check firewall state
echo   4. Turn off firewall (all profiles)
echo   5. Turn on firewall (all profiles)
echo   6. Exit
echo ================================
echo.
set /p choice=Enter choice (1-6): 

if "%choice%"=="1" goto allow
if "%choice%"=="2" goto remove
if "%choice%"=="3" goto check
if "%choice%"=="4" goto off
if "%choice%"=="5" goto on
if "%choice%"=="6" exit
goto menu

:allow
cls
echo.
set /p port=Enter port to allow: 
echo.
echo Adding firewall rule for port %port% ...
netsh advfirewall firewall add rule name="Port%port%" dir=in action=allow protocol=TCP localport=%port%
if %errorLevel%==0 (
    echo Firewall rule added successfully.
) else (
    echo Failed to add firewall rule.
)
echo.
pause
goto menu

:remove
cls
echo.
set /p port=Enter port to remove: 
echo.
echo Removing firewall rule for port %port% ...
netsh advfirewall firewall delete rule name="Port%port%" protocol=TCP localport=%port%
if %errorLevel%==0 (
    echo Firewall rule removed successfully.
) else (
    echo Failed to remove firewall rule.
)
echo.
pause
goto menu

:check
cls
echo.
echo Current firewall state:
echo.
netsh advfirewall show allprofiles
echo.
pause
goto menu

:off
cls
echo.
echo Turning off firewall for all profiles...
netsh advfirewall set allprofiles state off
echo Firewall is now OFF.
echo.
pause
goto menu

:on
cls
echo.
echo Turning on firewall for all profiles...
netsh advfirewall set allprofiles state on
echo Firewall is now ON.
echo.
pause
goto menu
