::-----------------------------------------------------------------------------::
:: Name .........: setqtver.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0
:: Description ..: Temporary Script to set Qt Version in main environment
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::
::-----------------------------------------------------------------------------::

@ECHO OFF
SetLocal EnableDelayedExpansion
SET "validArgs=5.12.2,5.12.3,5.12.4,5.13.0"
GOTO _MAIN

:_MAIN
SET tmp_file=%JTSDK_CONFIG%\qt.ver
ECHO ----------------------------------
ECHO JTSDK64 Tools QT Version Selection
ECHO ----------------------------------
ECHO.
ECHO Valid Qt Versions:
for %%a in ("%validArgs:,=" "%") do (
    echo    %%~a
)
ECHO.
ECHO At the prompt, type the version number
ECHO you whish to use:
ECHO.
set /p selection="Selection : "
GOTO _VALIDATE

:_VALIDATE
IF ["%selection%"]==["5.12.2"] ( GOTO _FOUND )
IF ["%selection%"]==["5.12.3"] ( GOTO _FOUND )
IF ["%selection%"]==["5.12.4"] ( GOTO _FOUND )
IF ["%selection%"]==["5.13.0"] ( GOTO _FOUND )
GOTO _NOTFOUND

:_FOUND
DEL /F /Q "%JTSDK_CONFIG%\qt5.12.2" >NUL 2>&1
DEL /F /Q "%JTSDK_CONFIG%\qt5.12.3" >NUL 2>&1
DEL /F /Q "%JTSDK_CONFIG%\qt5.12.4" >NUL 2>&1
DEL /F /Q "%JTSDK_CONFIG%\qt5.13.0" >NUL 2>&1
type nul > %JTSDK_CONFIG%\qt%selection%
if %ERRORLEVEL% == 0 (
    ECHO.
    ECHO New Version set to : %selection%
    ECHO.
    ECHO IMPORTANT: Changing QT Versions requires restarting
    ECHO the main JTSDK64 Tools Environment.
    ECHO.
    GOTO EOF
)
GOTO EOF

:_NOTFOUND
ECHO.
ECHO The version you you set ( %selection% ) is not valid.
ECHO Please use one of the following versions:
ECHO.
FOR %%a in ("%validArgs:,=" "%") DO (
    echo    %%~a
)
GOTO EOF

:EOF
exit /b 0
