#!/bin/bash

# GHIDRA AND PYENV REQUIRED
# Creates a new virtualenv and sets up Ghidra's Jython so that it can use the packages installed in that virtualenv.

# COMMAND LINE ARGS
# $1: Python version to use for the virtualenv (must have already been installed
# with "pyenv install <version>")
# $2: Name of the virtualenv
# $3: Path to Ghidra's Jython site-packages (can be found by invoking "import site; site.getsitepackages()" from within Jython itself)

eval "$(pyenv init -)"
pyenv virtualenv $1 $2
pyenv activate $2
python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())" > $3/python.pth
