# JTSDK64-Tools ( jt64config )

| Application Data ||
| ---| --- |
| Package             | `jt64config`
| Version             | 0.0.22
| Topic               | Communications, Ham Radio
| Development Status  | 5 - Production/Stable
| Distributions       | Windows, Linux
| Arch                | x86-64
| Python              | Version >= 3.5
| Dependencies        | Standard Python Library, colorconsole
| Virtual Environment | [Miniconda Python]

## Development Status

This package is in `Production`, and was tested using [Miniconda Python][]
in a default virtual environment e.g. (`conda create -n jtpy python=3`).

## Description

Simple [Python][] script that sets various configuration options associated
with [JTSDK64-Tools][]. Currently, it only supports Windows. Linux flavors will
be added in future releases.

## Requirements

- Any [Python][] version >= 3.5, virtual or native installation
- No special modules or distributions are required.

## Installation

This package resides in the main [PyPi Production][] repository and can be
installed using `pip`.

Open a condole, and type the following:

```bash
# JTSDK64-Tools users, activate jtpy first
conda activate jtpy

# Install command:
pip install jt64config
```

## Upgrade Package

Open a console, and type the following:

```bash
# For JTSDK64-Tools users, active jtpy first
conda activate jtpy

# Upgrade the package
pip install jt64config -U
```

## Usage

```bash
    In the console, type: jt64config

    usage: jt64config.py [-h] [+a] [-a] [+c] [-c] [+hc] [-hc] [+q] [-q] [+r]
                         [-r] [+s] [-s] [+u] [-u] [+d] [-d] [-l] [-od]
                         [-status] [-v]

    JTSDK64 Tools Configuration

    optional arguments:
      -h, --help          show this help message and exit
      +a                  enable autorun
      -a                  disable autorun
      +c                  enable clean
      -c                  disable clean
      +hc                 enable hamlib clean
      -hc                 disable hamlib clean
      +q                  enable quiet mode
      -q                  disable quiet mode
      +r                  enable reconfigure
      -r                  disable reconfigure
      +s                  enable separate
      -s                  disable separate
      +u                  enable unix tools
      -u                  disable unix tools
      +d, +default        enable default item set
      -d, -default        disable default item set
      -l, --list          list supported options
      -od, --description  print long descriptions
      -status, --status   display option status
      -v, --version       display application version
```

## Uninstall

This action applies only to those that installed `jt64config` using `pip`.

```bash
# For JTSDK64-Tools, activate jtpy first
conda activate jtpy

# Uninstall command
pip uninstall jt64config
```

[Install Miniconda Python]: `https://ki7mt.github.io/jtsdk64-tools/`
[JTSDK64-Tools]: `https://github.com/KI7MT/jtsdk64-tools`
[test.pypi.org]: `https://test.pypi.org/project/jt64config/`
[PyPi Production]: `https://pypi.org/project/jt64config/`
[Miniconda Python]: `https://docs.conda.io/en/latest/miniconda.html`
[Python]: `https://www.python.org/`
