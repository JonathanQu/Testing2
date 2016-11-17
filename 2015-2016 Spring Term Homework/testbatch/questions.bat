@echo off
:Q1
echo what particle emitted during decay has an overall positive charge?
set /p answer=
if %answer% == positron echo correct
if %answer% == positron goto Q2
echo wrong
goto Q1
:Q2
echo  question 2
pause