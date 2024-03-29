# Makefile for Linux
#
# Prerequsists : GNU Make, Python, Setuptools, Twine

PROGRAM	:= jt64gentc
AUTHOR	:= Greg Beam, KI7MT
LICENSE	:= GPLv3
BUGS	:= https://github.com/KI7MT/jtsdk64-tools/issues
WEB	:= https://github.com/KI7MT/jtsdk64-tools

# make programs
PYTHON	:= $(shell which python)
TWINE	:= $(shell which twine)
PIP	:= $(shell which pip)
RM	:= $(shell which rm)

# pip install command
COMMAND	:= install -e .

# requirments files
PWD	:= $(shell pwd)
REQ	:= $(PWD)/requirements.txt
REQDEV	:= $(PWD)/requirements-dev.txt

# publication  install commands
TPUB	:= -i https://test.pypi.org/simple/ jt64gentc
PPUB	:= install jt64gentc

## publication end points
PUBTEST	:= upload --repository-url https://test.pypi.org/legacy/ dist/*
PUBPROD	:= upload dist/*

# targets
all: install

clean:
	@clear ||:
	@echo '---------------------------------------------'
	@echo "Cleaning $(PROGRAM)
	@echo '---------------------------------------------'
	@echo ''
	$(PYTHON) setup.py clean -a
	@echo "\nFinished\n"

distclean:
	@clear ||:
	@echo '---------------------------------------------'
	@echo "Distribution Clean $(PROGRAM)
	@echo '---------------------------------------------'
	@echo ''
	$(RM) -rf ./dist ./build ./$(PROGRAM)/__pycache__ $(PROGRAM).egg*
	@echo "\nFinished\n"

install:
	@clear ||:
	@echo '---------------------------------------------'
	@echo "Installing $(PROGRAM)
	@echo '---------------------------------------------'
	@echo ''
	$(PIP) $(COMMAND)
	@echo "\nFinished\n"

uninstall:
	@clear ||:
	@echo '---------------------------------------------'
	@echo "Uninstalling $(PROGRAM)
	@echo '---------------------------------------------'
	@echo ''
	$(PIP) uninstall -y ${PROGRAM}
	@echo "\nFinished\n"

setup:
	@clear ||:
	@echo '---------------------------------------------'
	@echo "Installl Requirments"
	@echo '---------------------------------------------'
	@echo ''
ifeq ($(shell test -e $(REQ) && echo -n yes),yes)
	$(PIP) install -r $(REQ)
else
	@echo "Nothing to do, file does not exist"
endif
	@echo "\nFinished\n"

setupdev:
	@clear ||:
	@echo '---------------------------------------------'
	@echo "Installl Developer Requirments"
	@echo '---------------------------------------------'
	@echo ''
ifeq ($(shell test -e $(REQDEV) && echo -n yes),yes)
	$(PIP) install -r $(REQDEV)
else
	@echo "Nothing to do, file does not exist"
endif
	@echo "\nFinished\n"

dist:
	@clear ||:
	@echo '---------------------------------------------'
	@echo "Packaging Distribution $(PROGRAM)"
	@echo '---------------------------------------------'
	@echo ''
	$(PYTHON) setup.py sdist bdist_wheel
	@echo "\nFinished\n"

pubtest:
	@clear ||:
	@echo '---------------------------------------------'
	@echo "Publish to PyPi Test Site (test.pypi.org)"
	@echo '---------------------------------------------'
	@echo ''
	$(TWINE) $(PUBTEST)
	@echo ''
	@echo 'To install the distribution from test.pypi.org'
	@echo 'use the following command :'
	@echo ''
	@echo pip install $(TPUB)
	@echo ''
	@echo "\nFinished\n"

publish:
	@clear ||:
	@echo '---------------------------------------------'
	@echo "Publish to PyPi Production (pypi.org)"
	@echo '---------------------------------------------'
	@echo ''
	$(TWINE) $(PUBPROD)
	@echo ''
	@echo 'To install the distribution from pypi.org'
	@echo 'use the following command :'
	@echo ''
	@echo pip install $(PPUB)
	@echo ''
	@echo "\nFinished\n"

help:
	@clear ||:
	@echo ''
	@echo '---------------------------------------------'
	@echo "Makefile Help"
	@echo '---------------------------------------------'
	@echo ''
	@echo ' Available Make Commands:'
	@echo ''
	@echo ' make [option]'
	@echo ''
	@echo ' make              runs the install target'
	@echo ' make clean        cleans the build tree'
	@echo ' make distclean    clean distribution folders'
	@echo ' make install      installs locally with pip -e .'
	@echo ' make uninstall    uninstalls the application'
	@echo ' make setup        installs requirements.txt'
	@echo ' make setupdev     installs requirements-dev.txt'
	@echo ' make dist         generates distribution wheel'
	@echo ' make pubtest      publishes to test.pypi.org for dev testing'
	@echo ' make publish      publishes to pypi.org for production use'
	@echo ''
