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
:map <F6> :!g++ -o vim.out % && ./vim.out; rm vim.out <cr>
=======

" C++ custom syntax highlighting
" Additions for more C++ syntax highlighting.
" Tobias Anderberg, 2013.

syn keyword cppCustomStatement       nullptr

syn keyword cppCustomStlContainers   array vector deque forward_list list
syn keyword cppCustomStlContainers   set map multiset multimap
syn keyword cppCustomStlContainers   unordered_set unordered_map
syn keyword cppCustomStlContainers   unordered_multiset unordered_multimap
syn keyword cppCustomStlContainers   stack queue priority_queue
syn keyword cppCustomStlContainers   string

syn match   cppCustomParen         "?=(" contains=cParen,cCppParen
syn match   cppCustomFunc          "\w\+\s*(\@=" contains=cppCustomParen
syn match   cppCustomScope         "::"
syn match   cppCustomClass         "\w\+\s*::" contains=cppCustomScope

syn match   cppCustomStlNamespace  "std::" contains=cppCustomScope

hi def link cppCustomFunc       Function
hi def link cppCustomStatement  Statement

" Custom syntax definitions
hi def link cppCustomClass         ClassNamespace
hi def link cppCustomStlNamespace  StlNamespace
hi def link cppCustomStlContainers StlContainer

" Execute with F7 key
:map <F6> :!gcc -lm -o vim.out % && ./vim.out; rm vim.out <cr>
:map <F7> :!make && ./`basename % .c`; make clean <cr>
