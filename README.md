# JTSDK64 Tools

## Version 3.1.0.2

**JTSDK64 Tools** is a collection of 64-Bit [Open Source][] frameworks,
library's and associated utilities focused on compiling [WSJT-X][], [WSJT][],
[MAP65][], and [WSPR][] applications which are designed for weak-signal digital
communication used by amateur radio operators world wide.

The primary focus of this document is to install the **JTSDK64 Core Tools**, or
the minimal requirements for compiling the [WSJT][] suite of applications
including [Hamlib][]. Anything else should be considered optional, and posted
in supplemental documentation.

## Preparation

Before installing `JTSDK64-Tools`, you should remove all previous versions of
`JTSDK`, particularly those elements that were installed to system folders
such as:

- Git
- VS Code
- PostgreSQL
- Python, Anaconda or Miniconda
- Java, Maven, Gradle, Ant

>IMPORTANT: When removing [Git][] or [VS Code][], you will `not` loose
any of your custom settings. Such items are kept outside the installation tree
and will be picked back up at the next install. Likewise, with PostgreSQL,
the uninstaller *does not* remove your databases. Python and Java Apps are
simple re-installaiton.

Before stating the installation:

- Be sure all applications are closed
- Perform a system re-boot

## Download, Installation and Configuration

All you need to get started is contained within the [InnoSetup][]
installers available at [JTSDK SourceForge][]

Download both the Tools and Apps installers

- Download [JTSDK64-Tools-3.1.0][]
- Download [JTSDK64-Apps-3.1.0.2][]

Run Each Installer In Order

1. Run the jtsdk64-tools-3.1.0.exe
2. Run the jtsdk64-apps-3.1.0.2.exe

## Postinstall

When the update installer is finished, use the Windows Start Menu and launch
**JTSDK64-Setup**

```shell
Start >> JTSDK64-Tools >> JTSDK64-Setup
```

Skip the Upgrade Section and proceed to [New Installation](#new-installation)

## Upgrade Current Installation

If you are upgrading from a previous installation, all that is required is to
run the apps install and upgrade Python Packages.

1. Run the Apps Installer: [JTSDK64-Apps-3.1.0.2][]

Then from **JTSDK64-Setup**, update Python Packages

```shell
# At the command prompt, type:

pysetup install-deps
```

You can also upgrade from the source package itself

```shell
# While still in JTSDK64-Setup
Type: home

# If you have checked out jtsdk64-tools previously
cd src\jtsdk64-tools\src
git pull
git checkout master
make install

# If you have not checked out jtsdk64-tools before
cd src
git clone https://github.com/KI7MT/jtsdk64-tools.git
cd jtsdk64-tools\src
git checkout master
make install
```

The Make Install command will copy all the scripts, and install the
required Python Packages using the requirements.txt file.

After updating the **JTSDK64** environment scripts, update MSYS2 Scripts

```shell
# From JTSDK64-Tools, open MSYS2 console
Type: msys2

# At the MSYS2 console prompt, type
jtupdate
```

That concludes upgrading both the **JTSDK64** Environment, and MSYS2
scripts.

## New Installation

If this is a new installation, you need to run the post install script first.
At the `JTSDK64 Setup Prompt`, start the postinstall script with:

```shell
type: postinstall
```

You will be asked which applications you'd like to install by answering
` Y = Yes or N = No`. For Qt there are three possible answers,
`D = Default, F or Y = Full, or N = Skip`.

For first time installations. select all (required) options including MSYS2.

## Required Installs

For building WSJT-X and Hamlib, the following are required install / configuration items:

- **Python**, for managing the environment
- **Git-SCM**, source code management
- **QT**, libraries and compilers
- **MSYS2** for building Hamlib

## Option Selections

Regarding Qt, if you have any plans on testing / using multiple versions of Qt,
you should select the `F` option for a full installation.

>NOTE: Depending on your computer and internet speeds, this could take upwards
of an hour or more to complete; the majority of time taken by the Qt section.

```shell
 ---------------------------------------------------
 JTSDK64 Tools Post Install Selections
 ---------------------------------------------------

 At the prompts, indicate which components
 you want to install, use ( Y = Yes or N = No )

 For the Qt Install Selection:
   D      = Default ( minimal set of tools )
   F or Y = Full ( full set of tools )
   N      = Skip Installation

 NOTE: VS Code and PostgreSQL are NOT required
 for building WSJT-X, all others are.

Input Your Install Selections
(required) Python       : y
(required) Git-SCM      : y
(required) Full Qt      : Y
(required) MSYS2 Setup  : y
(optional) VS Code      : n
(optional) Postgres     : n
```

## MSYS2 Update and Configuration

As with `Previous JTSDK Installaitons`, the MSYS2 installation will need to be
updated *before* installing hamlib dependencies. You can do this manually with
a shortcut or through the menu system, the choice is yours. For consistency,
this document will be using the menu system.

You can read more about the [MSYS2][] setup process from their
[website](https://www.msys2.org).

### Main Screen

When [MSYS2] first opens up, it will go through a series of configurations for
the your current user; create home directory, generate profiles etc. Once
complete, you'll be presented with the main splash screen for
`JTSDK64 Tools MSYS2`.

### MSYS2 Splash Screen

```shell
JTSDK64 Tools MSYS2 using QT v

For main menu, type ..: menu
For Help Menu, type ..: jthelp

Copyright (C) 2013-2019, GPLv3, Greg Beam, KI7MT
This is free software; There is NO warranty; not even
for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# To use the menu, type:
menu
```

### JTSDK MSYS2 Menu Options

The following options are available on the `JTSDK64 Tools MSYS2 Menu`:

```bash
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

#### Update MSYS2 Database and Runtime Packages

1. The first set of actions is to use **select options 6** and upgrade the [MSYS2][]
database / runtime packages.
1. Once the first update is complete, click the **X** at the top right to
close the [MSYS2][] window.
1. Back in the `JTSDK64 Setup` environment, type **msys2** to re-lauch the console.
1. Run the menu again, type: **menu**
1. Select **option 6 again**
1. Repeat **option 6** until there are no further updates.

### Install Hamlib Dependencies

1. Using the menu tools menu again, select **option 2** to install Hamlib packages

### Building Hamlib

Now that the [MSYS2][] environment is updated, and all dependencies have been
installed, its time to build hamlib.

1. Using the [MSYS2][] Tools Menu, select **option 5**.

This will use the default QT version (**5.12.4**) to build the latest version of
Hamlib from Bill's (G4WJS) Git repository. The output location and other
associated build-details will be printed in the summary.

## Conclusion

At this point in the installation, the environment should be ready to build
[WSJT-X][] or be used for any number of other purposes. When the user guide is
complete, it will be posted to a Github.io page.

## Community Support

To assist users with installation, usage, compiling applications, and
general discussion, use:

- Post: JTSDK@groups.io
- Subscribe: JTSDK+subscribe@groups.io
- Unsubscribe: JTSDK+unsubscribe@groups.io
- Group Owner: JTSDK+owner@groups.io
- Help: JTSDK+help@groups.io

## Bug Reports

For submitting bug reports and feature requests, use the [Issue Tracker][].

The aim of `JTSDK64-Tools` is to use an Agile delivery approach to create a
high-quality, yet flexible build system. Utilizing Github's [Issue Tracker][].
users can quickly see the status of any particular request, discuss the merits,
and implement the final disposition.

[Open Source]: https://opensource.com/resources/what-open-source
[WSJT]: http://physics.princeton.edu/pulsar/K1JT/
[WSJT-X]: http://physics.princeton.edu/pulsar/K1JT/wsjtx.html
[MAP65]: http://physics.princeton.edu/pulsar/K1JT/map65.html
[WSPR]: http://physics.princeton.edu/pulsar/K1JT/wspr.html
[MSYS2]: https://www.msys2.org/
[PostgreSQL]: https://www.postgresql.org/
[Dotnet Core SDK]: https://docs.microsoft.com/en-us/dotnet/core/sdk
[Java Open JDK]: https://adoptopenjdk.net/
[Ant]: https://ant.apache.org/
[Maven]: https://maven.apache.org/
[Gradle]: https://gradle.org/
[InnoSetup]: http://www.jrsoftware.org/isinfo.php
[Hamlib]: https://hamlib.github.io/
[JTSDK Sourceforge]: https://sourceforge.net/projects/jtsdk/files/win64/3.1.0/
[JTSDK64-Tools-3.1.0]: https://sourceforge.net/projects/jtsdk/files/win64/3.1.0/jtsdk64-tools-3.1.0.exe
[JTSDK64-Apps-3.1.0.2]: https://sourceforge.net/projects/jtsdk/files/win64/3.1.0/jtsdk64-apps-3.1.0.1.exe
[Git]: https://git-scm.com/
[VS Code]: https://code.visualstudio.com/Download
[Issue Tracker]: https://github.com/KI7MT/jtsdk64-tools/issues
