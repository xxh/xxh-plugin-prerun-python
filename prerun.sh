CDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export PIP_TARGET=$XXH_HOME/.pip
export PYTHONPATH=$PIP_TARGET
export PATH=$PIP_TARGET/bin:$CDIR/python:$PATH
