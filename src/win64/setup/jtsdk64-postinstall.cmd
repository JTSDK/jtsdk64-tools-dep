
::-----------------------------------------------------------------------------::
:: Name .........: jtsdk64-postinstall.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Description ..: Installs Additional Componsnts based on User selections
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
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
    call %SETUP_DIR%\miniconda\pysetup-all.cmd
GOTO _GITSELECTION
)

:_GITSELECTION
if /I "%UserInputGit%" == "Y" (
    set install=Y
    call %SETUP_DIR%\git\git-install.cmd install
    GOTO _VSCODESELECTION
)

:_VSCODESELECTION
if /I "%UserInputVSCode%" == "Y" (
    set install=Y
    call %SETUP_DIR%\vscode\vscode-install.cmd install
GOTO _PGSQLSELECTION
)

:_PGSQLSELECTION
if /I "%UserInputPgsql%" == "Y" (
    set install=Y
    call %SETUP_DIR%\postgres\postgresql-install.cmd install
    GOTO _QTSELECTION
)

:_QTSELECTION

:: If option == N, skip installation
if /I "%UserInputQt%" == "N" (
    GOTO _MSYS2SELECTION
)

:: If option == D, install default set of options ( minimal )
if /I "%UserInputQt%" == "D" (
    set install=Y
    call %SETUP_DIR%\qt\qtinstall.cmd min
    GOTO _MSYS2SELECTION
)

:: If option == N, install full set of QT options
if /I "%UserInputQt%" == "F" (
    set install=Y
    call %SETUP_DIR%\qt\qtinstall.cmd full
    GOTO _MSYS2SELECTION
)

:_MSYS2SELECTION
if /I "%UserInputMsys2%" == "Y" (
    set install=Y
    call %JTSDK_HOME%\tools\msys64\msys2_shell.cmd
    GOTO _FINISHED
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
ECHO.
GOTO _MSG

:_MSG
ECHO  If you wish to re-enter selections type: postinstall
GOTO EOF

:EOF
exit /b