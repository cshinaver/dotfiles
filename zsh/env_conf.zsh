# TMUX
if which tmux 2>&1 >/dev/null; then
    #if not inside a tmux session, and if no session is started, start a new session
    #test -z "$TMUX" && (tmux attach || mux start school )
fi

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting