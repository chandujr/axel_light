@echo off
echo ------------------------------
echo Welcome to Axel
echo ================
echo Author: Wilmer van der Gaast
echo Batch file mod: Chandu JR
echo Thanks to: Stack Exchange Community
echo Last modified: 26/01/2017
echo ------------------------------
setlocal enabledelayedexpansion
set output=%cd%/output
set /p "link3=Download link:"
set "link2=!link3:&=^&!"
set "link="%link2%""
set /p maxConn="Max number of connections: "
set "var="&for /f "delims=0123456789" %%i in ("%maxConn%") do set var=%%i
if defined var (goto :ErrorPlace)
set /p isMaxSpeed="Allow unlimited speed? (y/n): "
set /a maxSpeed=10
if %isMaxSpeed% ==y (
axel -n %maxConn% -o %output% -a %link%
goto :NoErrorPlace
)
if %isMaxSpeed% ==n (
set /p maxSpeed="Maximum speed (in KB/sec): "
set /a maxSpeedinBytes=!maxSpeed!*1000
axel -n %maxConn% -s !maxSpeedinBytes! -o %output% -a %link%
goto :NoErrorPlace
) else (goto :ErrorPlace)
:ErrorPlace
echo ------------------------------
echo ERROR: Invalid Input
echo Rerun the program
echo ------------------------------
:NoErrorPlace
echo ------------------------------
echo Congrats :) Have a nice day!
echo ------------------------------
pause