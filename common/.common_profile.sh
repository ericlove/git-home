alias uno="git status -uno"
alias glg='git log'
alias gst='git status'
alias gdf='git diff'
alias gbr='git branch'
alias gcm='git commit'
alias gad='git add'

export VISUAL=vim


# To be called by .local_profile once AGENT_PATH is set
function ssh_add_or_start () {
  if [ -z "$AGENT_PATH" ]; then
    echo WARNING: AGENT_PATH environment variable not set
    echo Not launching ssh-agent
    return
  fi

  if [ -e $AGENT_PATH ] ; then
    source $AGENT_PATH
  else
    ssh-agent > $AGENT_PATH;
    source $AGENT_PATH;
  fi

  ssh-add -l > /dev/null;
  if [ $? -ne 0 ]; then
      ssh-agent > $AGENT_PATH;
      source $AGENT_PATH;
      ssh-add;
  fi
}

source ~/.local_profile.sh
