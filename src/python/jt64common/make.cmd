::-----------------------------------------------------------------------------::
:: Name .........: make.cmd
:: Project ......: JTSDK64 Tools Project
:: Description ..: Windows Makefile (make.cmd)
:: Project URL ..: https://github.com/ki7mt/jtsdk64-tools
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::
::-----------------------------------------------------------------------------::
@ECHO OFF

:: Requirments:
::     python
::     setuptools
::     twine
::     colorconsole
::
:: NOTES:
::
::   For Package Requirments
::     If you have runtime package requirements, add the file "requirements.txt"
::     to the root of the distribution.
::
::   For Development Requirements
::     For development requirements, use the requirments-dex.txt

:: Make File Variables
SET app_name=jt64common
SET pypitest=--repository-url https://test.pypi.org/legacy/ dist/*
SET pypiprod=dist/*
SET test_install=-i https://test.pypi.org/simple/ %app_name%
SET prod_install=install %app_name%
SET requirements=%CD%\requirements.txt
SET requirements-%CD%\dev=requirements-dev.txt

:: Get Command line Options %1
IF /I [%1]==[clean] ( GOTO _CLEAN )
IF /I [%1]==[distclean] ( GOTO _DISTCLEAN )
IF /I [%1]==[dist] ( GOTO _DIST )
IF /I [%1]==[install] ( GOTO _INSTALL )
IF /I [%1]==[uninstall] ( GOTO _UNINSTALL )
IF /I [%1]==[pubtest] ( GOTO _PUBTEST )
IF /I [%1]==[publish] ( GOTO _PUBLISH )
IF /I [%1]==[setup] ( GOTO _SETUP )
IF /I [%1]==[setupdev] ( GOTO _SETUPDEV )
IF /I [%1]==[help] ( GOTO _HELP )
GOTO _HELP

:: Clean the source tree
:_CLEAN
ECHO.
ECHO ----------------------------------------
ECHO  Clean Solution %app_name%
ECHO ----------------------------------------
ECHO.
python setup.py clean ^-a
GOTO EOF

:: Clean the source tree
:_DISTCLEAN
ECHO.
ECHO ----------------------------------------
ECHO  Clean Distribution %app_name%
ECHO ----------------------------------------
ECHO.
python setup.py clean ^-a
rmdir /s /q .\dist > NUL 2>&1
rmdir /s /q .\%app_name%.egg-info > NUL 2>&1
rmdir /s /q .\%app_name%\__pycache__ > NUL 2>&1
rmdir /s /q .\tools > NUL 2>&1
rmdir /s /q .\src > NUL 2>&1
rmdir /s /q .\scripts > NUL 2>&1
rmdir /s /q .\tmp > NUL 2>&1
GOTO EOF

:: Install application
:_INSTALL
ECHO.
ECHO ----------------------------------------
ECHO  Installing %app_name% locally with pip
ECHO ----------------------------------------
ECHO.
ECHO Installing Package: %app_name%
pip install ^-e .
ECHO.
ECHO Finished
GOTO EOF

:: Uninstall application
:_UNINSTALL
ECHO.
ECHO --------------------------------------------
ECHO  Installing %app_name% with pip
ECHO --------------------------------------------
ECHO.
pip uninstall ^-y %app_name%
ECHO.
GOTO EOF

:: Run pip install -r requirments.txt
:_SETUP
ECHO.
ECHO ----------------------------------------
ECHO  Setup Requirements
ECHO ----------------------------------------
ECHO.
IF EXIST %requirements% (
    ECHO Installing Requirements using pip
    pip install ^-r %requirements%
) else (
    ECHO Nothing to do, no requirements file
)
ECHO.
ECHO Finished
GOTO EOF

:: Run pip install -r requirments-dev.txt
:_SETUPDEV
ECHO.
ECHO ----------------------------------------
ECHO  Setup Developer Requirements
ECHO ----------------------------------------
ECHO.
IF EXIST %requirements-dev% (
    ECHO Installing Developer Requirements using pip
    pip install ^-r %requirements-dev%
) ELSE (
    ECHO Nothing to do, no developer requirements file
)
ECHO.
ECHO Finished
GOTO EOF

:: Run Python setuptools to package app
:_DIST
ECHO.
ECHO ----------------------------------------
ECHO  Distribution Package ^: %app_name%
ECHO ----------------------------------------
ECHO.
ECHO Creating Package: %app_name%
python setup.py sdist bdist_wheel
ECHO.
ECHO Finished
GOTO EOF

:: Run Python twine to publish to test.pypi.org
:_PUBTEST
ECHO.
ECHO ----------------------------------------
ECHO  Publishing to PyPi test Site
ECHO ----------------------------------------
ECHO.
ECHO Plublishing Package: %app_name%
twine upload %pypitest%

:: If the esit status was not 0, for to test publish error
IF %ERRORLEVEL% NEQ 0 (
   GOTO _TEST_PUBLISH_ERROR
)
ECHO.
ECHO To install ^[ %app_name% ^] from ^( test.pypi.org ^)^, run the
ECHO following command ^:
ECHO.
ECHO pip install %test_install%
ECHO.
ECHO.
ECHO Finished
GOTO EOF

:: Run Python twine to publish to test.pypi.org
:_PUBLISH
ECHO.
ECHO ----------------------------------------
ECHO  Publishing to PyPi Production Site
ECHO ----------------------------------------
ECHO.
ECHO Plublishing Package: %app_name%
twine upload %pypiprod%

:: If the exit status was not 0, goto publish error
IF %ERRORLEVEL% NEQ 0 (
   GOTO _PUBLISH_ERROR
)
ECHO.
ECHO To install ^[ %app_name% ^] from ^( pypi.org ^)^, run the
ECHO following command ^:
ECHO.
ECHO pip %prod_install%
ECHO.
ECHO.
ECHO Finished
GOTO EOF

:: Finished installation
ECHO   Finished
GOTO EOF

:: ----------------------------------------------------------------------------
::  HELP MESSAGE
:: ----------------------------------------------------------------------------
:_HELP
CLS
ECHO.
ECHO ----------------------------------------
ECHO  %app_name% Make Help
ECHO ----------------------------------------
ECHO.
ECHO  The build script takes one option^:
ECHO.
ECHO    clean      :  clean the build tree
ECHO    distclean  :  clean distribution files adn folders
ECHO    dist       :  generate distribution wheel
ECHO    install    :  install the application locally
ECHO    uninstall  :  uninstall the application
ECHO    pubtest    :  publish app to test.pypi.org
ECHO    publish    :  publish app to pypi.org
ECHO    setup      :  pip install requirements.txt
ECHO    setupdev   :  pip install requirements-dev.txt
ECHO.
ECHO    Example:
ECHO      make setup
ECHO      make clean
ECHO      make install
ECHO.
GOTO EOF

:_TEST_PUBLISH_ERROR
ECHO.
ECHO  Publishing to ^( test.pypi.org ^) failed.
ECHO  Check error messages on the screen, resolve
ECHO  the issue, and republish.
ECHO.
GOTO _ERROR_EXIT

:_PUBLISH_ERROR
ECHO.
ECHO  Publishing to ^( pypi.org ^) failed.
ECHO  Check error messages on the screen, resolve
ECHO  the issue, and republish.
ECHO.
GOTO _ERROR_EXIT

:EOF
EXIT /b 0

:_ERROR_EXIT
EXIT /B %ERRORLEVEL%
