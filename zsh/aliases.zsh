alias reload!='. ~/.zshrc'
alias homeserver="ssh -p 2222  bijan@$HOME_ADDRESS"
alias schoolssh="sshpass -e ssh cshinave@$SCHOOL_ADDRESS"
alias schoolsftp="sshpass -e sftp cshinave@$SCHOOL_ADDRESS"
alias inventory="ssh -X charles@inlint.esc.nd.edu"
alias xschoolssh="sshpass -e ssh -c arcfour,blowfish-cbc -XC cshinave@$SCHOOL_ADDRESS"
alias ryanpissh="ssh cshinaver@$RYANPI_ADDRESS"
alias info="info --vi-keys"
alias tl="tmux list-sessions"
function ta {tmux attach -t $1} # Attach to tmux sessions
alias b2d='eval "$(boot2docker shellinit)"'

# Git stuff
alias gdc="git diff --cached"

# Docker stuff
alias dco="docker-compose"
alias dcp="dco run --service-ports web"
alias dcr="dco run web"
alias dsh="docker run -v $(pwd):/kipwire_root -t -i --link db:db kipwire_web bash"
function hrun {heroku ps:scale web=0 &> /dev/null; echo $1 > /dev/stdout; heroku ps:scale web=1 &> /dev/null}

autoload -U zmv
alias mmv='noglob zmv -W' # Zsh multimove
