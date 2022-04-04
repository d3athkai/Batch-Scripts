@echo off 
setlocal enabledelayedexpansion


REM # DEFINITIONS #
set incognitoMode=True
set url[0]=yahoo.com 
set url[1]=bing.com 
set url[2]=msn.com 
set url[3]=duckduckgo.com 
set url[4]=wikipedia.com 


REM # MAIN #
set len=0 
:Loop 
if defined url[%len%] ( 
	set /a len+=1
	GOTO :Loop 
)

for /l %%n in (0,1,%len%) do ( 
	REM echo !url[%%n]!
	call set "URLS=%%URLS%% !url[%%n]!"
)

if "%incognitoMode%" == "False" (
	start chrome --start-maximized %URLS%
)
if "%incognitoMode%" == "True" (
	start chrome --start-maximized --incognito %URLS%
)
