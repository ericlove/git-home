MY_PATH=$HOME/bin:$HOME/scripts

if [ -z "$RC_ORIG_PATH" ]; then
  export RC_ORIG_PATH=$PATH
fi

if [ -z "$RC_ORIG_PATH" ]; then
  export PATH=$MY_PATH
else
  export PATH=$MY_PATH:$RC_ORIG_PATH
fi

