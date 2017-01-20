command -v virtualenvwrapper.sh &>/dev/null && source virtualenvwrapper.sh

# Nailgun for VimClojure REPL
export VIMCLOJURE_SERVER_JAR="$HOME/Dropbox/Programming/Clojure/server-2.3.6.jar"

function start-ssh-agent () {
    if ! pgrep -u $USER ssh-agent > /dev/null; then
        echo "shouldn't do this"
        ssh-agent > ~/.ssh-agent-thing
    fi
    if [[ "$SSH_AGENT_PID" -eq "" ]]; then
        eval $(<~/.ssh-agent-thing) >/dev/null
    fi
}

start-ssh-agent
