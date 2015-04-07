# TMUX
if which tmux 2>&1 >/dev/null; then
    #if not inside a tmux session, and if no session is started, start a new session
    if [[ -z $SSH_CONNECTION ]] then
        test -z "$TMUX" && (tmux attach || tmux )
    fi
fi

# Source customrc
source ~/.customrc

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
