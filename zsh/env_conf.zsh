# Source customrc
if [[ -f ~/.customrc ]]; then
    source ~/.customrc
fi

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Nailgun for VimClojure REPL
export VIMCLOJURE_SERVER_JAR="$HOME/Dropbox/Programming/Clojure/server-2.3.6.jar"
