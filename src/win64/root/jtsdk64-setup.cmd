::-----------------------------------------------------------------------------::
:: Name .........: jtsdk64-tools-setup.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0
:: Description ..: Main Environment Script
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly from the command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::
::-----------------------------------------------------------------------------::
@ECHO OFF
SET /P JTSDK64_VERSION=<%CD%\ver.jtsdk
@chcp 1252 >NUL 2>&1
@SET LANG=en_US
SET version=%JTSDK64_VERSION%
TITLE JTSDK64 Tools Setup %version%

:: Set a debug flag
IF /I [%1]==[-d] (
    SET debug=1
)
::------------------------------------------------------------------------------
:: GLOBAL ENVIRONMENT VARIABLES and PATHS
::------------------------------------------------------------------------------

:: Paths
SET JTSDK_HOME=%CD%
SET TOOLS_DIR=%JTSDK_HOME%\tools
SET SETUP_DIR=%JTSDK_HOME%\tools\setup
SET CURL_DIR=%SETUP_DIR%\curl\bin

:: Global Environment Variables Variables
SET GIT_INSTALL_DIR=%PROGRAMFILES%\Git
SET DOTNET_INSTALL_DIR=%PROGRAMFILES%\dotnet
SET PYTHON_INSTALL_DIR=%LOCALAPPDATA%\Miniconda3

SET PGSQL_INSTALL_DIR=%PROGRAMFILES%\PostgreSQL\11
SET PGSQL_DATA_DIR=%LOCALAPPDATA%\PostgreSQL\11\data

SET QT_INSTALL_DIR=%TOOLS_DIR%\Qt
SET JAVA_INSTALL_DIR=%PROGRAMFILES%\java
SET PATH=%JTSDK_HOME%;%TOOLS_DIR%;%SETUP_DIR%;%CURL_DIR%;%PATH%

::------------------------------------------------------------------------------
:: TOOL INSTALL VALIDATION
::------------------------------------------------------------------------------

:: Set Initial tool status
SET GIT_STATUS=Not Installed
SET PYTHON_STATUS=Not Installed
SET JTPY_STATUS=Not Installed
SET PGSQL_STATUS=Not Installed
SET QTMAINT_STATUS=Not Installed
SET QTCREATOR_STATUS=Not Installed
SET GCC73_STATUS=Not Installed
SET QT5122_STATUS=Not Installed
SET QT5123_STATUS=Not Installed
SET QT5124_STATUS=Not Installed
SET QT5130_STATUS=Not Installed
SET DOTNET_STATUS=Not Installed
SET JAVA_STATUS=Not Installed
SET ANT_STATUS=Not Installed
SET MAVEN_STATUS=Not Installed
SET GRADLE_STATUS=Not Installed
SET VSCODE_STATUS=Not Installed
GOTO APP_CHECK

:APP_CHECK
ECHO Gather tool^chain data, please wait...

ECHO Checking Git
git --version >NUL 2>&1
IF %ERRORLEVEL% == 0 ( SET GIT_STATUS=Installed )

ECHO Checking Dotnet SDK
dotnet --version >NUL 2>&1
IF %ERRORLEVEL% == 0 ( SET DOTNET_STATUS=Installed )

ECHO Checking VS Code
IF EXIST "%LOCALAPPDATA%\Programs\Microsoft VS Code\unins000.exe" (
SET VSCODE_STATUS=Installed
)

:: Check Java
ECHO Checking Java
java -version >NUL 2>&1
IF %ERRORLEVEL% == 0 ( SET JAVA_STATUS=Installed )

:: Check for Python
ECHO Checking Python
IF EXIST "%TOOLS_DIR%\python\python.exe" ( SET PYTHON_STATUS=Installed )

IF EXIST "%TOOLS_DIR%\python\Scripts\activate.bat" (
    call %TOOLS_DIR%\python\Scripts\activate.bat %TOOLS_DIR%\python
)

IF EXIST "%TOOLS_DIR%\python\envs\jtpy\python.exe" (
    call conda activate jtpy
    SET JTPY_STATUS=Enabled
)

:: PostgreSQL CHeck
ECHO Checking PostgreSQL
IF EXIST "%TOOLS_DIR%\PostgreSQL\11\pg_env.bat" ( SET PGSQL_STATUS=Installed )

:: Qt Tool Chain
ECHO Checking QT Tools
call "%SETUP_DIR%\qt\qtgenjs.cmd" >NUL 2>&1
IF EXIST "%TOOLS_DIR%\Qt\MaintenanceTool.exe" ( SET QTMAINT_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\Tools\QtCreator\bin\qtcreator.exe" ( SET QTCREATOR_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\5.12.2\mingw73_64\bin\Qt5Core.dll" ( SET QT5122_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\5.12.3\mingw73_64\bin\Qt5Core.dll" ( SET QT5123_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\5.12.4\mingw73_64\bin\Qt5Core.dll" ( SET QT5124_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\5.13.0\mingw73_64\bin\Qt5Core.dll" ( SET QT5130_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\Tools\mingw730_64\bin\gcc.exe" ( SET GCC73_STATUS=Installed )
GOTO _DOSKEYS

::------------------------------------------------------------------------------
:: DOSKEY's
::------------------------------------------------------------------------------

:_DOSKEYS
DOSKEY msys2 = %JTSDK_HOME%\tools\msys64\msys2_shell.cmd
DOSKEY gitsetup = call %SETUP_DIR%\git\git-install.cmd $*
DOSKEY pysetup = call %SETUP_DIR%\miniconda\python-install.cmd $*
DOSKEY pysetup-all = call %SETUP_DIR%\miniconda\pysetup-all.cmd
DOSKEY pgsetup = call %SETUP_DIR%\postgres\postgresql-install.cmd $*
DOSKEY qtsetup = call %SETUP_DIR%\qt\qt-install.cmd $*
DOSKEY codesetup = call %SETUP_DIR%\vscode\vscode-install.cmd $*
DOSKEY postinstall = call %SETUP_DIR%\jtsdk64-postinstall.cmd
DOSKEY home = cd /d %JTSDK_HOME% $T %SETUP_DIR%\cmd\greeting.cmd

::------------------------------------------------------------------------------
:: PRTINT TOOL CHAN STATUS / GREETING MESSAGE
::------------------------------------------------------------------------------

:_GREETING
call %SETUP_DIR%\cmd\greeting.cmd
GOTO EOF

:EOF
%WINDIR%\System32\cmd.exe /A /Q /K