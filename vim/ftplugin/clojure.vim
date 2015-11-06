" Clojure Paredit
let g:paredit_mode = 1

" Start repl in background
nmap <leader>sr :Start! lein repl<CR>

" Clojure formatting
set shiftwidth=2  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=2     " an hard TAB displays as 4 columns
set softtabstop=2 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
