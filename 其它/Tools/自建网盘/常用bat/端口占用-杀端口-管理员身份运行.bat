@echo off
title Kill Port

:: -----------------------
:: 检查管理员权限
:: -----------------------
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo You must run this script as Administrator!
    pause
    exit
)

:: -----------------------
:: 输入端口
:: -----------------------
set /p PORT=Enter port to kill: 

:: -----------------------
:: 查找 PID 并结束
:: -----------------------
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :%PORT% ^| findstr LISTENING') do (
    echo Killing process on port %PORT% with PID %%a
    taskkill /PID %%a /F
)

echo Done.
pause
