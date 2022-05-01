@ECHO OFF 
title WorldServer.exe || by: EternityCore
color 02
CLS 
ECHO Server Restart Started %time:~0,5% %date:~1% 
:SERVERLOOP 
worldserver.exe
ECHO Server Restart %time:~0,5% %date:~1% 
ECHO. 
GOTO SERVERLOOP 
:END