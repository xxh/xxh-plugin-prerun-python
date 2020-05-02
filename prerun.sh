if [[ $XXH_SHELL != "xonsh" ]]; then
  CDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
  export PYTHONHOME=`dirname $XDG_CONFIG_HOME`/.local
  export PYTHONUSERBASE=$PYTHONHOME
  export PYTHONPATH=$PYTHONHOME/lib/python3.8/site-packages:$PYTHONPATH
  export PATH=$PYTHONHOME/bin:$CDIR/python:$PATH
fi