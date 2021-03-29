"#   _____ _____
"#  |  _  |   __|  Piotr Serafin
"#  |   __|__   |  https://piotrserafin.dev
"#  |__|  |_____|  https://github.com/piotrserafin
"#

"""""""""""""""""""""""""
"  Basic Configuration  "
"""""""""""""""""""""""""
" Leader
let g:mapleader=" "

" Basic
syntax enable             "enable syntax highlight

set nocompatible          "won't be compatible with Vi
set noshowmode            "no message on status line to show current mode
set showcmd               "show (partial) command in status line
set mouse=a               "enable the use of mouse clicks for all modes
set encoding=utf-8        "encoding to be used for printing

" Identation
filetype indent on        "switch on file type detection, with automatic indenting and settings
set autoindent            "take indent for new line from previous line
set tabstop=4             "number of spaces that <Tab> in file uses
set shiftwidth=4          "number of spaces to use for (auto)indent step
set expandtab             "use spaces when <Tab> is inserted
set softtabstop=4         "number of spaces that <Tab> uses while editing

" Appearance
set number                "print the line number in front of each line
set relativenumber        "show relative line number in front of each line
set textwidth=120         "maximum width of text that is being inserted
set nowrap                "long lines nowrap
set ruler           	  "show the line and column number of the cursor position
set colorcolumn=120       "comma separated list of screen columns
set cursorline

" True Colors
set termguicolors         "Enables 24-bit RGB color in the TUI 

" Theme
try | colorscheme gruvbox | catch | endtry
set background=dark

" Search
set showmatch
set nohlsearch
set incsearch             "show dynamic matching pattern
set ignorecase            "ignore case when searching ... unless smartcase - see below 
set smartcase             "when use uppercase then it will match on case

" Edit
set nobackup
set noswapfile
set undodir=~/.local/share/nvim/undo
set undofile

set history=1000
set wildmenu
set wildmode=longest:list,full

set hidden
set noerrorbells
"set autochdir             "it will change to the directory containing the file which was opened or selected
set clipboard=unnamedplus "copy pase between nvim and everything else
