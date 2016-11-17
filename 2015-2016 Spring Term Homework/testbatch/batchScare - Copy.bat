@echo off
title Trivia Game
color 7
pause
echo Welcome to David's Game of Trivia!
echo.
echo Programmed by David B.
pause
cls
echo You will answer a series of random multiple-choice questions. Do your best! Each level will have 5 questions. You will go up a level once you answer 5 questions. If you answer a question wrong, you will go back to the beginning of that level.
pause
cls
goto L1
:incorrectL1
cls
echo You got the wrong answer!
pause
cls
echo What question # did you get wrong?
set /p variable=
if %variable% equ 1 goto 1
if %variable% equ 2 goto 2
if %variable% equ 3 goto 3
if %variable% equ 4 goto 4
if %variable% equ 5 goto 5
:L1
:1
echo Level 1
echo.
echo.
echo 1. What is the fastest object in the world?
echo.
echo A) Snail
echo B) Light
echo C) Thrust SSC
echo D) An airplane
echo.
set /p answer=
if %answer% neq B goto incorrectL1
echo.
cls
