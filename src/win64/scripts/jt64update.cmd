::-----------------------------------------------------------------------------::
:: Name .........: jt64update.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0
:: Description ..: Update script for main Github Repo
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::
::-----------------------------------------------------------------------------::
@echo off

:: Returns ERRORLEVEL=1 is %JTSDK_HOME% does not exist
IF [%JTSDK_HOME%]==[] (
echo.
echo  Update Error
echo.
echo  JTSDK_HOME Variable was not found.
echo  Ensure you running from the JTSDK64 Tools Environment
echo.
echo  If installing or upgrading from a Windows Console,
echo  please set the JTSDK_HOME variable before running jt64update.
echo.
exit /b 1
)
goto _START

:_START
set srcd=%JTSDK_HOME%\src
set pkg_name=jtsdk-tools
set git_url=https://github.com/KI7MT/jtsdk64-tools.git

cls
echo --------------------------------
echo  Upgrading JTSDK64 Tools Scripts
echo --------------------------------
echo.
echo  * Checking source project
if exist "%srcd%\%pkg_name%\src\make.cmd" ( goto _PULL )
goto _CHECKOUT

:_PULL
echo * Pulling updates from Github
pushd %srcd%\%pkg_name%
git pull
popd
goto _UPDATE

:_CHECKOUT
echo * Checking out source code from Github
pushd %srcd%
git clone %url%
popd
goto _UPDATE

:_UPDATE
pushd %srcd%\%pkg_name%\src
make clean
make install
popd
goto EOF

:EOF
exit /b 0