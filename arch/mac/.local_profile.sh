
if [ -z "$MAC_ORIG_PATH" ]; then
  export MAC_ORIG_PATH=$PATH
fi

function set_mac_path () {
  # Always start setting LOCAL_PATH with this line
  LOCAL_PATH="~/bin/:~/local/bin:$MAC_ORIG_PATH"

  # MacPorts Installer addition on 2015-11-21_at_16:39:05: adding an appropriate PATH variable for use with MacPorts.
  LOCAL_PATH="/opt/local/bin:/opt/local/sbin:$LOCAL_PATH"
  # Finished adapting your PATH environment variable for use with MacPorts.

  LOCAL_PATH="/usr/local/texlive/2014/bin/x86_64-darwin:$LOCAL_PATH"

  LOCAL_PATH="~/scripts:$LOCAL_PATH"

  # added by Anaconda2 4.1.1 installer
  LOCAL_PATH="~/anaconda/bin:$LOCAL_PATH"


  if [ -z "$MAC_ORIG_PATH" ]; then
    export PATH="$LOCAL_PATH"
  else
    export PATH="$LOCAL_PATH"
  fi
}

set_mac_path

export LD_LIBRARY_PATH="~/install/lib"

function rgrep () {
  grep --color -r $1 .
}
