" " Pep8 regs
" set textwidth=79  " lines longer than 79 columns will be broken
" set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
" set tabstop=4     " an hard TAB displays as 4 columns
" set expandtab     " insert spaces when hitting TABs
" set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
" set shiftround    " round indent to multiple of 'shiftwidth'
" set autoindent    " align the new line indent with the previous line
" set nowrap        " don't wrap lines
" set copyindent    " copies previous indentation on autoindenting
" set number        " always show line numbers
" set showmatch     " shows matching parenthesis
" set ignorecase    " ignore case when searching
" set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
" set hlsearch      " highlight search terms
" set incsearch     " show search matches as you type
" set undolevels=1000      " many undo levels
" set title                " change terminal title
" set nobackup
" set noswapfile

" Execute with F7 key
:map <F7> :!make && ./`basename % .c`; make clean <cr>
