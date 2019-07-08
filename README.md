# JTSDK64 Tools

**JTSDK64 Tools** is a collection of 64-Bit [Open Source][] frameworks, library's and
associated utilities focused on compiling [WSJT-X][], [WSJT][], [MAP65][], and
[WSPR][] applications which are designed for weak-signal digital communication used amateur radio operators world wide.

In addition to the required [WSJT] build dependencies, a number of optional
tools are available: [MSYS2][], [PostgreSQL][], [Dotnet Core SDK][],
[Java Open JDK][], [Ant][], [Maven][], [Gradle][], and more.

The primary focus of this document is to install the **JTSDK64 Core Tools**, or
the minimal requirements for compiling the [WSJT][] suite of applications
including [Hamlib][].

## Preparation

Before installing `JTSDK64-Tools`, you should remove all previous versionf od `JTSDK`, particularly those elements of the installation that installed to the system folders; such as:

- Git
- VS Code
- PostgreSQL
- Python, all Anaconda and Miniconda versions.
- Java

If you chose to leave them installed, you will need to edit the `Global Variables and Environment` section of the `jtsdk64-setup.cmd` script and point the relevant paths to your current install configuration.

```shell
::---------------------------------------------------------------------------
:: GLOBAL ENVIRONMENT VARIABLES and PATHS
::---------------------------------------------------------------------------

:: Paths
SET JTSDK_HOME=%CD%
SET TOOLS_DIR=%JTSDK_HOME%\tools
SET SETUP_DIR=%JTSDK_HOME%\tools\setup
SET CURL_DIR=%SETUP_DIR%\curl\bin

:: Global Environment Variables Variables
SET GIT_INSTALL_DIR=%PROGRAMFILES%\Git
SET DOTNET_INSTALL_DIR=%PROGRAMFILES%\dotnet
SET PYTHON_INSTALL_DIR=%LOCALAPPDATA%\Miniconda3

SET PGSQL_INSTALL_DIR=%PROGRAMFILES%\PostgreSQL\11
SET PGSQL_DATA_DIR=%LOCALAPPDATA%\PostgreSQL\11\data

SET QT_INSTALL_DIR=%TOOLS_DIR%\Qt
SET JAVA_INSTALL_DIR=%PROGRAMFILES%\java
```

>NOTE: For JAVA_HOME, either at the system level or script, this will need
to be adjusted at some point. Currently, Java and associated apps like Ant, Maven and Gradle are "NOT" part of the Core Tools. No Immediate action is required for Java at this time.

Before stating the installaiton:
- Be sure all applications are closed
- Perform a system re-boot
- The run the main `jtsdk64-tools-3.1.0.exe` installer.

## Installation and Configuration

All you need to get started is contained within in a single [InnoSetup][]
installer available at [JTSDK SourceForge][].

### Download Installer

- Download [JTSDK64-Version-3.1.0][]

Once downloaded, run the installer as a `non-admin` user. The install location
is fixed to a specific folder, however, you may select whatever drive suites
your system needs. For this example, I will be using the `C:` drive throughout.

### Postinstall

When the installer finishes, the `JTSDK64 Setup Script` will open automatically
and you will see a list of `Installed` components. You may have one or more of
the components such as [Git][] or [VS Code][] already installed. You can find
the setup script either in the Windows Program Start Menu, or in the root
of the install directory itself.

```bash
# Stat Menu
JTSDK64-Tools >> JTSDK64 Setup

# For C: Drive
C:\JTSDK64-Tools\jtsdk64-setup.cmd

# For D: Drive
D:\JTSDK64-Tools\jtsdk64-setup.cmd
```

At the `JTSDK64 Setup Prompt`, start the postinstall script with:
```shell
type: postinstall
```

You will be asked which applications you'd like to install by answering ` Y = Yes or N = No`. For Qt there are three answers: `M = Minimal, F = Full, or S = Skip`.

For first time installations. select all the available options including MSYS2. Regarding Qt, if you have any plans on testing / using multiple version of Qt, you should select the `F` option for a full installation.

>NOTE: Depending on your computer and internet speeds, this could take upwards of an hour to install with the majority of time taken by the Qt section.

```shell
 ---------------------------------------------------
 JTSDK64 Tools Post Install Selections
 ---------------------------------------------------

 At the prompts, indicate which components
 you want to install, use ( Y = Yes or N = No )

 For the Qt Install Selection:
   D = Default ( minimal set of tools )
   F = Full ( full set of tools )
   N = Skip Installation

Input Your Install Selections
Python       : y
Git-SCM      : y
VS Code      : y
Postgres     : y
Full Qt      : f
MSYS2 Setup  : y

Your Install Selections Were:
  Python   : y
  Git      : y
  VS Code  : y
  Postgres : y
  Qt All   : f
  MSYS2    : y
```







## Appendix 1 Install Locations

The following are the install locations for various applications associated
with `JTSDK64 Tools`.

### WIndows 10 Environment Variables

On Windows 10, the default system locations are as follows:

| Variable       | Description              | Location         |
| :------------  |:------------------------ | :--------------- |
| %PROGRAMFILES% | 64-Bit App Dir           | C:\Program Files |
| %LOCALAPPDATA  | User App & Data Location | C:\Users\%USERNAME%\AppData |
| %PROGRAMDATA   | Program Data             | C:\ProgramData |
| %USERNAME%     | Login Users Name         | C:\Users\<users-name> |

### System Level Install Locations

The following are `JTSDK64 Tools` system level install locations based on
the Windows 10 Environment Variables from above.

#### Core Tools

| Application     | Install Locations
| :------------   | :-----------------
| Git             | %PROGRAMFILES\Git
| VS Code         | %LOCALAPPDATA%\Programs\Microsoft VS Code
| Miniconda       | %LOCALAPPDATA%\Programs\Miniconda3
| PostgreSQL      | %PROGRAMFILES\PostgreSQL\11
| PostgreSQL Data | %LOCALAPPDATA%\PostgreSQL\11\data


[Open Source]: `https://opensource.com/resources/what-open-source`
[WSJT]: `http://physics.princeton.edu/pulsar/K1JT/`
[WSJT-X]: `http://physics.princeton.edu/pulsar/K1JT/wsjtx.html`
[MAP65]: `http://physics.princeton.edu/pulsar/K1JT/map65.html`
[WSPR]: `http://physics.princeton.edu/pulsar/K1JT/wspr.html`
[MSYS2]: `https://www.msys2.org/`
[PostgreSQL]: `https://www.postgresql.org/`
[Dotnet Core SDK]: `https://docs.microsoft.com/en-us/dotnet/core/sdk`
[Java Open JDK]: `https://adoptopenjdk.net/`
[Ant]: `https://ant.apache.org/`
[Maven]: `https://maven.apache.org/`
[Gradle]: `https://gradle.org/`
[InnoSetup]: `http://www.jrsoftware.org/isinfo.php`
[Hamlib]:`https://hamlib.github.io/`
[JTSDK Sourceforge]: `https://sourceforge.net/projects/jtsdk/files/win32/3.1.0/`
[JTSDK64-Version-3.1.0]: `https://sourceforge.net/projects/jtsdk/files/win32/3.1.0/jtsdk64-tools-3.1.0.exe`
[Git]: `https://git-scm.com/`
[VS Code]: 11