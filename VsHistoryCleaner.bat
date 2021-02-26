@echo off & color 17

if exist "%systemroot%\SysWOW64" path %path%;%windir%\SysNative;%systemroot%\SysWOW64;%~dp0
                
bcdedit > nul

if '%errorlevel%' neq '0' (goto UACPrompt) else (goto UACAdmin)

:UACPrompt
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close) & exit
exit /b

:UACAdmin
cd /d "%~dp0"

echo Current Path: "%cd%"
echo You are getting admin privileges.

:: Please insert your script...

:: vs 2005
reg delete HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\8.0\FileMRUList /va /f
reg delete HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\8.0\ProjectMRUList /va /f

:: vs 2008
reg delete HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\9.0\FileMRUList /va /f
reg delete HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\9.0\ProjectMRUList /va /f

:: vs 2010
reg delete HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\10.0\FileMRUList /va /f
reg delete HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\10.0\ProjectMRUList /va /f

:: vs 2012
reg delete HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\11.0\FileMRUList /va /f
reg delete HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\11.0\ProjectMRUList /va /f

:: vs 2013
reg delete HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\12.0\FileMRUList /va /f
reg delete HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\12.0\ProjectMRUList /va /f

:: vs 2015
reg delete HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\14.0\FileMRUList /va /f
reg delete HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\14.0\ProjectMRUList /va /f

:: vs 2017
del C:\Users\%username%\AppData\Local\Microsoft\VisualStudio\15.0_635cbd13\ApplicationPrivateSettings.xml

:: vs 2019
del C:\Users\%username%\AppData\Local\Microsoft\VisualStudio\16.0_b405f274\ApplicationPrivateSettings.xml