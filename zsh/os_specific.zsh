# checks (stolen from zshuery)
if [[ $(uname) = 'Linux' ]]; then
    IS_LINUX=1
    export TERM="xterm-256color"
    alias ports="sudo netstat -tapen | grep"
    export PATH="/usr/bin:$PATH"

fi

if [[ $(uname) = 'Darwin' ]]; then
    IS_MAC=1
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    alias ports="sudo lsof -i -n -P | grep TCP"
fi
