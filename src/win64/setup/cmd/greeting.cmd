:: ---------------------------------------------------------------------------::
:: Name .........: greeting.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0
:: Description ..: Setup Tools Greeting message
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
:: Usage ........: Call this file directly from the command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
:: ---------------------------------------------------------------------------::

IF /I [%debug%]==[1] (
    ECHO Running in Debug mode
) ELSE (
    CLS
)

ECHO --------------------------------------------
ECHO  JTSDK64 Tools Setup %version%
ECHO --------------------------------------------
ECHO.
ECHO  Required Tool Status
ECHO     Python ....... %PYTHON_STATUS%
ECHO     Git .......... %GIT_STATUS%
ECHO.
ECHO  Qt Tool Chain Status
ECHO     5.12.2 ....... %QT5122_STATUS%
ECHO     5.12.3 ....... %QT5123_STATUS%
ECHO     5.12.4 ....... %QT5124_STATUS%
ECHO     5.13.0 ....... %QT5130_STATUS%
ECHO     GCC 7.3 ...... %GCC73_STATUS%
ECHO     QtCreator .... %QTCREATOR_STATUS%
ECHO     Maintenance .. %QTMAINT_STATUS%
ECHO.
ECHO  Optional Tool Status
ECHO     VS Code ...... %VSCODE_STATUS%
ECHO     Postgres ..... %PGSQL_STATUS%
ECHO.
ECHO  Help Commands
ECHO     Python ....... pysetup help
ECHO     Git .......... gitsetup help
ECHO     Qt ........... qtetup help
ECHO     VS Code ...... codesetup help
ECHO     Postgres ..... pgsetup help
ECHO.
ECHO  Post Installation
ECHO  To run the post installation script, type: postinstall
ECHO.