cls
@ECHO OFF 
title Folder lock
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK 
if NOT EXIST Private goto MDENTER PASSWORD TO OPEN 
:CONFIRM 
echo ------------folder lock-------------------
echo Are you sure you want to lock the folder(Y/N) 
echo Press (Y) for Yes and Press (N) for No. 
echo ----------------------------------------------------------- 
set/p "cho=>" 
if %cho%==Y goto LOCK 
if %cho%==y goto LOCK 
if %cho%==n goto END 
if %cho%==N goto END 
echo Invalid choice. 
goto CONFIRM 
:LOCK 
ren private "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" 
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" 
echo Folder locked 
goto End 
:UNLOCK 
echo ---------------folder lock-----------------
echo Enter password to unlock folder  
set/p "pass=>" 
if NOT %pass%== 123 goto FAIL

attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" 
ren  "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Private 
echo Folder Unlocked successfully 
goto End 
:FAIL 
echo Invalid password 
goto end 
:MDENTER PASSWORD TO OPEN 
md Private 
echo Private created successfully 
goto End 
:End 