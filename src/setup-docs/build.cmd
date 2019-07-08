@ECHO OFF
REM ----------------------------------------------------------------------------
REM  Name .........: build.cmd
REM  Function .....: Builds PDF and HTML Documentaiton using Asciidoctor
REM  Project ......: CSCI-221 - System and Analysis & Design
REM  Usage ........: build pdf or build html
REM
REM  Author .......: Greg, Beam, <gregory.beam@mail.helenacollege.edu>
REM  Copyright ....: Copyright (C) 2017, Greg Beam
REM  License ......: GPL-3
REM
REM  build.cmd is free software: you can redistribute it and/or modify it under the
REM  terms of the GNU General Public License as published by the Free Software
REM  Foundation either version 3 of the License, or (at your option) any later
REM  version. 
REM
REM  build.cmd is distributed in the hope that it will be useful, but WITHOUT ANY
REM  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
REM  A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
REM
REM  You should have received a copy of the GNU General Public License
REM  along with this program.  If not, see <http://www.gnu.org/licenses/>.
REM  ---------------------------------------------------------------------------

cls
goto START

:START
IF /I [%1]==[help] (
GOTO HELP-OPTIONS
) ELSE IF /I [%1]==[pdf] (
GOTO BUILD-PDF
) ELSE IF /I [%1]==[html] (
GOTO BUILD-HTML
) ELSE IF /I [%1]==[epub] (
GOTO BUILD-EPUB
) ELSE ( GOTO HELP-OPTIONS )

:BUILD-PDF
ECHO Converting main.adoc ^=^> into gw^-main-.pdf
asciidoctor-pdf -D .\build main.adoc -o gw-main-pdf.pdf
GOTO EOF

:BUILD-HTML
ECHO Converting main.adoc ^=^> gw^-main.html
asciidoctor -b html5 -a data-uri -D .\build main.adoc -o gw-main-html.html
GOTO EOF

:BUILD-EPUB
ECHO Converting main.adoc ^=^> gw^-main.epub
asciidoctor-epub3 -D .\build main.adoc -o gw-main-epub.epub
GOTO EOF

:HELP-OPTIONS
ECHO. --------------------------------------------------------
ECHO.  Documentation Build Help Message
ECHO. --------------------------------------------------------
ECHO.
ECHO   Usage: build ^( target ^)
ECHO.
ECHO   There are two targets available
ECHO   [ pdf ] or [ html]
ECHO.
ECHO.  build pdf  ..^: Build the PDF version
ECHO.  build html ..^: Build HTML version
ECHO. 
ECHO.
GOTO EOF

:EOF
POPD
ECHO Done

exit /b 0




