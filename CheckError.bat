
@echo off        
:: BatchGotAdmin        
:-------------------------------------        
REM  --> Check for permissions  
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"  
REM --> If error flag set, we do not have admin.  
if '%errorlevel%' NEQ '0' (    echo Requesting administrative privileges...    ) else ( goto gotAdmin )  
:UACPrompt  
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"  
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"  
    "%temp%\getadmin.vbs"  
    exit /B
:gotAdmin  






@echo off
title make your choice
color 1
echo --------------------------------------
echo.
echo 1- dism
echo 2- sfc /scanow
echo 3- quit
echo.
echo --------------------------------------















set /p choice=Enter your choice (1-3):
if "%choice%"=="1" goto dism
if "%choice%"=="2" goto sfc
if "%choice%"=="3" goto quit





:dism
cls
dism /online /cleanup-image /restorehealth
pause

:sfc
cls
@echo off
title sfc /scannow
color b
sfc /scannow
:quit
cls
exit