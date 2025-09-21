@echo off
title Portproxy Manager (Any Port)

:menu
echo ===============================
echo   Select an option:
echo   1. Add forwarding "0.0.0.0:PORT -> 127.0.0.1:PORT"
echo   2. Show all rules
echo   3. Delete a rule by port
echo   4. Exit
echo ===============================
set /p choice=Enter choice (1-4): 

if "%choice%"=="1" goto add
if "%choice%"=="2" goto show
if "%choice%"=="3" goto del
if "%choice%"=="4" exit
goto menu

:add
set /p port=Enter port to add: 
echo Adding portproxy rule for port %port% ...
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=%port% connectaddress=127.0.0.1 connectport=%port%
echo Done.
pause
goto menu

:show
netsh interface portproxy show all
pause
goto menu

:del
set /p port=Enter port to delete: 
echo Deleting portproxy rule for port %port% ...
netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=%port%
echo Done.
pause
goto menu
