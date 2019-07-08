::-----------------------------------------------------------------------------::
:: Name .........: make.cmd
:: Project ......: Part of the JTSDK Version 3.1.0 Project
:: Description ..: Install all JTSDK64 Tools Scripts and Files
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::
::-----------------------------------------------------------------------------::
@ECHO OFF

:: Returns ERRORLEVEL=1 is %JTSDK_HOME% does not exist
IF [%JTSDK_HOME%]==[] (
ECHO.
ECHO  Make Error
ECHO.
ECHO  JTSDK_HOME Variable was not found.
ECHO  Ensure you running from the JTSDK64 Tools Environment
ECHO.
ECHO  If installing or upgrading from a Windows Console,
ECHO  please set the JTSDK_HOME variable before running make.
ECHO.
exit /b 1
)
GOTO _START

:_START
:: Set the Git tag into a file
>%JTSDK_HOME%\ver.git (
git rev-parse --short HEAD
)

:: Get Command line Options %1
IF /I [%1]==[clean] ( GOTO _CLEAN )
IF /I [%1]==[build] ( GOTO _BUILD )
IF /I [%1]==[publish] ( GOTO _PUBLISH )
IF /I [%1]==[install] ( GOTO _INSTALL )
IF /I [%1]==[help] ( GOTO _HELP )
GOTO HELP

:_CLEAN
CLS
ECHO ------------------------------
ECHO  Clean Python Apps
ECHO ------------------------------
ECHO.
PUSHD %CD%\python

ECHO Cleaning All Release Files
call .\jt64common\make.cmd clean
call .\jt64gentc\make.cmd clean
call .\jt64environment\make.cmd clean
call .\jt64version\make.cmd clean
POPD
GOTO EOF

:_BUILD
CLS
ECHO ------------------------------
ECHO  Building Python Apps
ECHO ------------------------------
ECHO.

PUSHD %CD%\python
call .\jt64common\make.cmd dist
call .\jt64gentc\make.cmd dist
call .\jt64environment\make.cmd dist
call .\jt64version\make.cmd dist
POPD
GOTO EOF

:_PUBLISH
CLS
ECHO ------------------------------
ECHO  Publishing Python Apps
ECHO ------------------------------
ECHO.
PUSHD %CD%\python
call .\jt64common\make.cmd publish
call .\jt64gentc\make.cmd publish
call .\jt64environment\make.cmd publish
call .\jt64version\make.cmd publish
POPD
GOTO EOF

:_INSTALL
CLS
ECHO ------------------------------
ECHO  Installing Python Apps
ECHO ------------------------------
ECHO.
ECHO Installing JT64 Common
ECHO ----------------------
pip install jt64common -U

ECHO Installing JT64 Eenv
ECHO ----------------------
pip install jt64environment -U

ECHO Installing JT64 Gentc
ECHO ----------------------
pip install jt64gentc -U

ECHO Installing JT64 Version
ECHO -----------------------
pip install jt64version -U
ECHO.
POPD

:: Change Directories to src\win64
PUSHD %CD%\win64

ECHO  Installing Win64 Setup Files
robocopy %CD%\setup %JTSDK_HOME%\tools\setup /E /MIR

ECHO  Installing Win64 Scripts
robocopy %CD%\scripts %JTSDK_HOME%\tools\scripts /E /MIR

ECHO  Installing Win64 Root Files
robocopy %CD%\root %JTSDK_HOME% /NFL /NDL /NJH /NJS /nc /ns /np

POPD

:: Finished installation
ECHO   Finished
GOTO EOF

:: ----------------------------------------------------------------------------
::  HELP MESSAGE
:: ----------------------------------------------------------------------------
:_HELP
CLS
ECHO ------------------------------
ECHO  JTSDK Make Help
ECHO ------------------------------
ECHO.
ECHO  The build script takes only one option^:
ECHO.
ECHO    clean       :  clean the build tree
ECHO    build       :  build source tree
ECHO    publish     :  publish the application
ECHO    install     :  install all applications
ECHO.
ECHO    Example:
ECHO    make publish
ECHO    make install
ECHO.
GOTO EOF

:EOF
EXIT /b 0

:: ----------------------------------------------------------------------------
::  ERROR MESSAGES
:: ----------------------------------------------------------------------------
:_NOT_DEFINED
CLS
ECHO ------------------------------
ECHO  Environment Error
ECHO ------------------------------
ECHO.
ECHO   JTSDK_HOME ^= NOT SET
ECHO.
ECHO   This script must be run from within
ECHO   the JTSDK Environment.
ECHO.
ECHO   Alternatively, you can manyally set the
ECHO   JTSDK_HOME variable with the following:
ECHO.
ECHO   C-Drive Location
ECHO   set JTSDK_HOME=C:\JTSDK-Tools
ECHO.
ECHO   D-Drive Location
ECHO   set JTSDK_HOME=D:\JTSDK-Tools
ECHO.
ECHO   Then re-run your commands.
ECHO.
exit /b 1