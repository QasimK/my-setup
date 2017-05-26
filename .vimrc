" Size of a hard tabstop (so we can tell the difference)
set tabstop=8

" Always uses spaces instead of tab characters
set expandtab

" Size of an "indent"
set shiftwidth=4

" Automatically indent the right amount
set smarttab

" Relative and Absolute line numbers
set relativenumber
set number

" Syntax highlighting
syntax enable

" Unset the "last search pattern" register by hitting <Return>
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>

" Auto-indent (plain text and for file types)
set autoindent
filetype plugin indent on
