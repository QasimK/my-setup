" <F2> to toggle between copy-and-paste that Just Works (TM)
" OR: use gvim
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" <Ctrl-L> to switch line numbers on/off
noremap <C-L> :set number! relativenumber!

" Unset the "last search pattern" register by hitting <Return>
nnoremap <CR> :nohlsearch<CR><CR>
set hlsearch            " Highlight search

" Use X clipboard (requires gvim NOT vim to be installed)
set clipboard=unnamedplus

set showmode
set tabstop=8           " Size of a hard tabstop (so we can tell the difference)
set expandtab           " Always uses spaces instead of tab characters
set shiftwidth=4        " Size of an "indent"
set smarttab            " Automatically indent the right amount
set number              " Show line numbers
set relativenumber      " Show relative line numbers
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set autowrite           " Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set mouse=a             " Enable mouse usage (all modes)

" Syntax highlighting
if !exists("g:syntax_on")
    syntax enable
endif

" Auto-indent (plain text and for file types)
set autoindent
filetype plugin indent on

" Save files as sudo with ":w!!" when forgetting to start vim with sudo
cmap w!! w !sudo tee > /dev/null %

" Adjust netrw browser to do something...
let g:netrw_banner = 0
