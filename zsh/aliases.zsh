alias reload!='. ~/.zshrc'
alias homeserver="ssh -p 2222  bijan@$HOME_ADDRESS"
alias schoolserver="ssh cshinave@$SCHOOL_ADDRESS"
alias inventory="ssh -X charles@inlint.esc.nd.edu"
alias xschoolserver="ssh -c arcfour,blowfish-cbc -XC cshinave@$SCHOOL_ADDRESS"

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
