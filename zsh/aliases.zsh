alias reload!='. ~/.zshrc'
alias homeserver="ssh -p 2222  bijan@$HOME_ADDRESS"
alias schoolssh="sshpass -e ssh cshinave@$SCHOOL_ADDRESS"
alias schoolsftp="sshpass -e sftp cshinave@$SCHOOL_ADDRESS"
alias inventory="ssh -X charles@inlint.esc.nd.edu"
alias xschoolserver="ssh -c arcfour,blowfish-cbc -XC cshinave@$SCHOOL_ADDRESS"
