@echo off
setlocal enabledelayedexpansion
title FileBrowser LAN Launcher

:: -----------------------
:: 检查管理员权限
:: -----------------------
echo Checking administrator privileges...
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo You must run this script as Administrator!
    pause
    exit
)
echo Administrator check passed.
echo.

:: -----------------------
:: 切换到 BAT 所在目录
:: -----------------------
echo Switching to BAT directory: %~dp0
cd /d %~dp0
echo Current directory: %cd%
echo.

:: -----------------------
:: 设置端口号
:: -----------------------
set PORT=8080
echo Target port: %PORT%
echo.

:: -----------------------
:: 检查端口是否被占用，如果占用则杀掉进程
:: -----------------------
echo Checking if port %PORT% is in use...
set PORT_FOUND=0
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :%PORT% ^| findstr LISTENING') do (
    echo Port %PORT% is in use by PID %%a. Killing it...
    taskkill /PID %%a /F
    set PORT_FOUND=1
)
if "%PORT_FOUND%"=="0" (
    echo Port %PORT% is free.
)
echo.

:: -----------------------
:: 获取本机 IPv4 地址
:: -----------------------
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr "IPv4"') do (
    set IP=%%A
    set IP=!IP: =!
    goto :foundIP
)
:foundIP
echo Local IPv4 address detected: %IP%
echo You can access FileBrowser from LAN at http://%IP%:%PORT%
echo.

:: -----------------------
:: 启动 FileBrowser 前台
:: -----------------------
echo Starting FileBrowser on port %PORT% binding to all interfaces (0.0.0.0)...
echo Output will stay in this CMD window. Press Ctrl+C to stop.
echo.
filebrowser.exe --port %PORT% --address "0.0.0.0"
echo.

echo FileBrowser stopped. Close this CMD to exit.
pause
