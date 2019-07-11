# JTSDK64 MSYS2 Installation

The JTSDK MSYS2 Scripts are pre-installed in the MSYS2 environment when using
the published InnoSetup Windows Installer from Sourceforge. However, there
are provisions for installing the scripts manually is need be.

## Provides

1. Pacman function for upgrading all MSYS2 packages.
1. Easy to use `menu system` for all alias functions
1. Bash function for installing Hamlib build dependencies.
1. Bash script for building Hamlib from source code and other useful functions.

## Installation and Setup

The following steps should be performed in order assuming a new installation
of. Subsequent runs of each command can be run anytime you wish to upgrade
packages or re-build Hamlib.

1. [Update MSYS2 Packages](#update-msys2-packages)
1. [Upgrade MSYS2 Scripts](#upgrade--msys2-scripts)
1. [Install Hamlib Dependencies](#install-hamlib-dependencies)
1. [Build Hamlib](#build-hamlib)

## Command List, Help Screens, and Upgrades

The `JTSDK64 MSYS2` package provides a number of useful commands and help
screens. Additional instructions are provided to upgrade `JTSDK64-Tools-MSYS2`.

1. [Command Summary](#command-summary)
1. [Command Helpers](#command-helpers)
1. [Upgrade MSYS2 Scripts](#upgrade-msys2-scripts)

These lists will be updates as the package grows. The initial screen when MSYS2
first opens.

>Note the inclusion of the Qt version.

```shell
JTSDK64 Tools MSYS2 using QT v5.12.4

For main menu, type ..: menu
For Help Menu, type ..: jthelp

Copyright (C) 2013-2019, GPLv3, Greg Beam, KI7MT
This is free software; There is NO warranty; not even
for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

Using the menu system can save time and prevent errors.

```shell
-------------------------------------
JTSKD64 Tools Main Menu
------------------------------------
 1. List help commands
 2. Install hamlib dependencies
 3. Update scripts
 4. Print version information
 5. Build hamlib
 6. Update msys2 packages
 e. Enter 'e' or 'q' to exit
Enter your selection, then hit <return>:

```

## Update MSYS2 Packages

After initial installation, often there are several packages that need to be
upgraded. This is particularly true for the main MSYS2 runtime binaries. This
function can be run any time you wish to upgrade your MSYS2.

If you are using the menu system, select **option 6**.

```bash
# From the console, type:
msys-update
```

If any of the msys2 runtime dlls are updated (*you will see a message at
the bottom of the screen*) close the terminal using the "**X**" in the top-right
corner of the window. Re-open the MSYS2 Console and run the update again.
Repeat this step until there are no further updates installed (*normally, this
takes at least two update cycles*).

## Upgrade MSYS2 Scripts

Before building or installing Hamlib build dependencies, its good practice
to update the build scripts before hand, thus ensuring the latest available
scripts.

If you are using the menu system, select **option 3**.

```bash
# Open MSYS2 Console, then perform the following
jtupdate
```

If you have removed the package from the src directory, perform a new checkout
then install.

```bash
# Open MSYS2 Console, and perform the following
mkdir -p ~/src
cd ~/src
git clone https://github.com/KI7MT/jtsdk64-tools.git
cd ./jtsdk64-tools/src/msys2
make install
source ~/bin/jtsdk_setup.sh
```

## Install Hamlib Dependencies

To install the required Hamlib build dependencies, run the following command.
This command can be run at any time you whish to update just the Hamlib build
dependencies.

If you are using the menu system, select **option 2**.

```bash
# Open MSYS2 Console, then run the following, type:
jtsetup
```

## Build Hamlib

The QT Version is now dynamically set using the global environment variable
**$QTV**, determined by the main **jtsdk64.cmd** script. At present, the script
will compile using any of the following Qt version:

- 5.12.2, GCC 7.3.0, 64-bit
- 5.12.3, GCC 7.3.0, 64-bit
- 5.12.4, GCC 7.3.0, 64-bit
- 5.13.0, GCC 7.3.0, 64-bit

As additional versions of Qt are validated, they will be added as options.

```bash
# To build Hamlib, use the following command, type:
build-hamlib
```

If the build finished successfully, the Hamlib libraries and associated binaries
will be installed (*copied*) to the following Locations:

>NOTE: (C|D) denotes the diver letter of your `JTSDK64-Tools` installation. The
following example shows a `D-Drive Installation`.

```bash
# Final report from build script
-----------------------------------------------------
  TESTING RIGCTL
-----------------------------------------------------

rigctl(d), Hamlib 4.0~git

Copyright (C) 2000-2012 Stephane Fillod
Copyright (C) 2000-2003 Frank Singleton
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.

-----------------------------------------------------
  FINISHED INSTALLING [ Hamlib ]
-----------------------------------------------------

  Tool-Chain........: QT 5.12.2
  Source Location...: /home/ki7mt/src/hamlib/src
  Build Location....: /home/ki7mt/src/hamlib/build
  Install Location..: /d/JTSDK64-Tools/tools/hamlib/qt/5.12.2
  Package Config....: /d/JTSDK64-Tools/tools/hamlib/qt/5.12.2/lib/pkgconfig/hamlib.pc
```

## Command Summary

The following alias commands are available to users after installation.

| Command       | Description                                      |
| :------------ |:------------------------------------------------ |
| jthelp        | Show this help menu                              |
| jtsetup       | Install Hamlib Build Dependencies                |
| jtupdate      | Upgrade JTSDK64 Tools MSYS2 Scripts              |
| jtversion     | Show JTSDK64 MSYS2 Version Information           |
| build-hamlib  | Build Hamlib Libraries and Binaries              |
| msys-update   | Upgrade all MSYS2 packages                       |
| menu          | Use menu for commands                      |

## Command Helpers

There are many ways to improve the usability of virtually any Bash shell. The
following commands have been enabled when using the `JTSDK64 MSYS2 Scripts`.

| Command  | Switch             | Description                            |
| :------- | :----------------- |:-------------------------------------- |
| df       | df -h              | Human readable system information      |
| du       | du -h              | Human readable disk usage              |
| less     | less -r            | Raw control characters                 |
| whence   | type -a            | Where, of a sort                       |
| grep     | grep --color       | Show differences in color              |
| egrep    | egrep --color=auto | Show differences in color              |
| fgrep    | fgrep --color=auto | Show differences in color              |
| ls       | ls -hF --color=tty | Fancy show files in color              |
| dir      | ls --color=auto --format=vertical | Show files vertical in color |
| vdir     | ls --color=auto --format=long | Long format file listing |
| l        | ls -CF | Shortcut to using ls |
| ll       | ls -l  | Shortcut to using vidr, or long list |
| la       | ls -A  | All files long version |
