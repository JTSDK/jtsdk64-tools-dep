# JTSDK64-Tools ( jt64version )

| Application Data ||
| ---| --- |
| Package             | `jt64version`
| Version             | 0.0.22
| Topic               | Communications, Ham Radio
| Development Status  | 5 - Production/Stable
| Distributions       | Windows, Linux
| Arch                | x86-64
| Python              | Version >= 3.5
| Dependencies        | Standard Python Library, colorconsole
| Virtual Environment | [Miniconda Python]

## Development Status

This package is in `Beta`, and was tested using [Miniconda Python][]
in a default virtual environment e.g. (`conda create -n jtpy python=3`).

## Description

Simple [Python][] script to print application versions associated with
[JTSDK64-Tools][]. Currently, it only supports Windows. Linux flavors will be
added in future releases.

## Requirements

- Any [Python][] version >= 3.5, virtual or native installation
- No special modules or distributions are required.

## Installation

This package resides in the main [PyPi Production][] repository and can be
installed using `pip`.

Open a console, and type the following:

```bash
# For JTSDK64-Tools users, activate jtpy first
conda activate jtpy

# Install command:
pip install jt64version
```

## Upgrade Package

Open a console, and type the following:

```bash
# For JTSDK64-Tools users, active jtpy first
conda activate jtpy

# Upgrade the package
pip install jt64version -U
```

## Usage

```bash
    In the console, type: jt64version

    Print Application Versions associated with `JTSDK64-Tools`

    Optional arguments:
      None
```

This action applies only to those that installed `jt64version` using `pip`.

```bash
# For JTSDK64-Tools users, activate jtpy first
conda activate jtpy

# Uninstall command
pip uninstall jt64version
```

[Install Miniconda Python]: `https://ki7mt.github.io/jtsdk64-tools/`
[JTSDK64-Tools]: `https://github.com/KI7MT/jtsdk64-tools`
[test.pypi.org]: `https://test.pypi.org/project/jt64version/`
[PyPi Production]: `https://pypi.org/project/jt64version/`
[Miniconda Python]: `https://docs.conda.io/en/latest/miniconda.html`
[Python]: `https://www.python.org/`
