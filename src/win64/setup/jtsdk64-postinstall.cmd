
::-----------------------------------------------------------------------------::
:: Name .........: jtsdk64-postinstall.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Description ..: Installs Additional Componsnts based on User selections
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools.git
:: Usage ........: Call this from jtsdk64-tools-setup => jtsdk64-postinstall $*
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPLv3
::-----------------------------------------------------------------------------::
@ECHO OFF
SetLocal EnableDelayedExpansion
set install=N
CLS
ECHO.
ECHO  ---------------------------------------------------
ECHO  JTSDK64 Tools Post Install Selections
ECHO  ---------------------------------------------------
ECHO.
ECHO  At the prompts, indicate which components
ECHO  you want to install, use ( Y = Yes or N = No )
ECHO.
ECHO  For the Qt Install Selection:
ECHO    D = Default ( minimal set of tools )
ECHO    F = Full ( full set of tools )
ECHO    N = Skip Installation

:_GETSELECTIONS
ECHO.
ECHO Input Your Install Selections
set /p UserInputPython="Python       : "
set /p UserInputGit="Git-SCM      : "
set /p UserInputVSCode="VS Code      : "
set /p UserInputPgsql="Postgres     : "
set /p UserInputQt="Full Qt      : "
set /p UserInputMsys2="MSYS2 Setup  : "
GOTO _PRINTANSWERS

:_PRINTANSWERS
ECHO.
ECHO Your Install Selections Were:
echo   Python   : %UserInputPython%
echo   Git      : %UserInputGit%
echo   VS Code  : %UserInputVSCode%
echo   Postgres : %UserInputPgsql%
echo   Qt All   : %UserInputQt%
echo   MSYS2    : %UserInputMsys2%
ECHO.

:: -----------------------------------------------------------------------------
:: SELECTIONS
:: -----------------------------------------------------------------------------

:_PYTHONSELECTION
if /I "%UserInputPython%" == "Y" (
    set install=Y
    set step=Python Install
    call %SETUP_DIR%\miniconda\pysetup-all.cmd
    if %ERRORLEVEL% EQU 0 goto _GITSELECTION
    goto error_message
)

:_GITSELECTION
if /I "%UserInputGit%" == "Y" (
    set install=Y
    set step=Git Install
    call %SETUP_DIR%\git\git-install.cmd install
    if %ERRORLEVEL% EQU 0 GOTO _VSCODESELECTION
    goto error_message

)

:_VSCODESELECTION
if /I "%UserInputVSCode%" == "Y" (
    set install=Y
    set step=VS Code Install
    call %SETUP_DIR%\vscode\vscode-install.cmd install
    if %ERRORLEVEL% EQU 0 GOTO _PGSQLSELECTION
    goto error_message
)

:_PGSQLSELECTION
if /I "%UserInputPgsql%" == "Y" (
    set install=Y
    set step=PostgreSQL Install
    call %SETUP_DIR%\postgres\postgresql-install.cmd install
    if %ERRORLEVEL% EQU 0 GOTO _QTSELECTION
    goto error_message
)

:_QTSELECTION

:: If option == N, skip installation
if /I "%UserInputQt%" == "N" (
    GOTO _MSYS2SELECTION
)

:: If option == D, install default set of options ( minimal )
if /I "%UserInputQt%" == "D" (
    set install=Y
    set step=QT Default Install
    call %SETUP_DIR%\qt\qt-install.cmd min
    if %ERRORLEVEL% EQU 0 GOTO _MSYS2SELECTION
    goto error_message
)

:: If option == N, install full set of QT options
if /I "%UserInputQt%" == "Y" (
    set install=Y
    set step=QT Full Install
    call %SETUP_DIR%\qt\qt-install.cmd full
    if %ERRORLEVEL% EQU 0 GOTO _MSYS2SELECTION
    goto error_message
)

:: If option == N, install full set of QT options
if /I "%UserInputQt%" == "F" (
    set install=Y
    set step=QT Full Install
    call %SETUP_DIR%\qt\qt-install.cmd full
    if %ERRORLEVEL% EQU 0 GOTO _MSYS2SELECTION
    goto error_message
)

:_MSYS2SELECTION
if /I "%UserInputMsys2%" == "Y" (
    set install=Y
    call %JTSDK_HOME%\tools\msys64\msys2_shell.cmd
    if %ERRORLEVEL% EQU 0 GOTO _FINISHED
    goto error_message
)
if /I "%install%" == "Y" (
GOTO _FINISHED
)
GOTO _NOTHINGTODO

:_NOTHINGTODO
ECHO.
ECHO Nothing to do. All available options were either No.
GOTO _MSG

:_EXITINSTALL
ECHO.
ECHO Exiting Post Installation.
GOTO _MSG

:_FINISHED
ECHO.
CLS
ECHO  ---------------------------------------------------
ECHO  JTSDK64 Tools Post Install Summary
ECHO  ---------------------------------------------------
ECHO.
ECHO  Finished Post Installation
ECHO. Exit the JTSDK64 Tools Setup Environment, and
ECHO  re-open to see the current status of installed tools.
if /I "%UserInputMsys2%" == "Y" (
ECHO.
ECHO  MSYS2 Initial Setup requires several rounds of installs.
ECHO  Following the MSYS on screem messages to perform the Initial
ECHO  installation and updates.
ECHO.
ECHO  Aftter updating MSYS2 itself, select the appropriate menu
ECHO  option to install Hamlib Dependencies.
ECHO.
)

ECHO.
GOTO _MSG

:_MSG
ECHO  If you wish to re-enter selections type: postinstall
GOTO EOF

:EOF
exit /b

:error_message
echo Processing Error
echo.
echo The exit status from step [ %step% ] returned
echo a non-zero status. Check the error message and
echo and try again.
echo.
echo  If the problem presists^, contact^: JTSDK@Groups.io
echo.