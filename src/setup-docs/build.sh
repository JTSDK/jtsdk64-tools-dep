#!/usr/bin/env bash

#----------------------------------------------------------------------------
#  Name .........: build.sh
#  Function .....: Builds PDF and HTML Documentaiton using Asciidoctor
#  Project ......: CSCI-221 - System and Analysis & Design
#  Usage ........: build.sh pdf | build html | build epub
#
#  Author .......: Greg, Beam, <gregory.beam@mail.helenacollege.edu>
#  Copyright ....: Copyright (C) 2017, Greg Beam
#  License ......: GPL-3
#
#  build.cmd is free software: you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation either version 3 of the License, or (at your option) any later
#  version. 
#
#  build.cmd is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
#  A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#  ---------------------------------------------------------------------------

set -e

# local variables
OPTION=$1
INFILE='main.adoc'

clear
echo "Building $INFILE type [$OPTION]"  
case $OPTION in
    pdf|PDF)
        asciidoctor-pdf -D ./build main.adoc -o gw-main-pdf.pdf
        echo "File: $(pwd)/build gw-main-pdf.pdf"
    ;;
    html|HTML)
        asciidoctor -b html5 -a data-uri -D ./build main.adoc -o gw-main-html.html
        echo "File: $(pwd)/build gw-main-html.html"
    ;;
    epub|EPUB)
        asciidoctor-epub3 -D ./build main.adoc -o gw-main-epub.epub
        echo "File: $(pwd)/build gw-main-epub.epub"
    ;;
    *)
        echo "Unknown Tile Type [$OPTION]"
        echo "Nothing To Do, Bye!!"
    ;;
esac

exit 0