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

