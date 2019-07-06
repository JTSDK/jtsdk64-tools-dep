# JTSDK64-Tools ( jt64env )

| Application Data ||
| ---| --- |
| Package             | `jt64env`
| Version             | 0.0.9
| Topic               | Communications, Ham Radio
| Development Status  | 4 - Beta
| Distributions       | Windows, Linux
| Arch                | x86-64
| Python              | Version >= 3.5
| Dependencies        | Standard Python Library, colorconsole
| Virtual Environment | [Miniconda Python]

## Development Status

This package is in `Beta`. The package was tested using
[Miniconda Python][] with a default virtual environment creation e.g.
(`conda create -n jtpy python=3`).

## Description

Simple [Python][] script that prints various environment variables associated
with [JTSDK64-Tools][]. Currently, it only supports Windows. Linux flavors will
be added in future releases.

## Requirements

If using the self-contained executable, there is no requirement to
[Install Miniconda Python][], otherwise, see the following:

- If running [JTSDK64-Tools][], install [Install Miniconda Python][].
- Any [Python][] version >= 3.5, virtual or native installation
- No special modules or distributions are required.

## Installation

This script resides int the main [PyPi][] repository. Installation is via pip
using the following command:

Open a condole, and type the following:

```bash
# If using JTSDK-Tools, activate jtpy first
conda activate jtpy

# Install command:
pip install --upgrade jt64env
```

## Usage

```bash
    In the console, type: jt64env

    Lists all available JTSDK-Tools Environment Variables

    optional arguments:
      -h, --help     show this help message and exit
      -v, --version  display module version
```

| ![Set Environment](docs/images/jt64env.PNG?raw=true) |
|:--:|
| *JTSDK64 Environment Variables* |

## Uninstall

This action apply's only to those that installed `jt64env` using `pip`.

```bash
# JTSDK64-Tools Env and type the following.
# Ensure jtpy is the active Python environment
conda activate jtpy

# Uninstall command
pip uninstall jt64env
```

## Change Log

**Version 0.0.9**:

- Initial release to production [PyPi][]


[Install Miniconda Python]: https://github.com/KI7MT/jtsdk-dotnet-core/wiki/Install-Python
[JTSDK64-Tools]: https://github.com/KI7MT/jtsdk64-tools-scripts
[test.pypi.org]: https://test.pypi.org/project/jt64env/
[PyPi]: https://pypi.org/project/jt64common/
[Miniconda Python]: https://docs.conda.io/en/latest/miniconda.html
[Python]: https://www.python.org/
