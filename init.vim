"#   _____ _____
"#  |  _  |   __|  Piotr Serafin
"#  |   __|__   |  https://piotrserafin.dev
"#  |__|  |_____|  https://github.com/piotrserafin
"#

"""""""""""""
"  Imports  "
"""""""""""""
source $HOME/.config/nvim/plugins.vim

"""""""""""""""""""""""""
"  Basic Configuration  "
"""""""""""""""""""""""""
" Basic
syntax on                 "turn on syntax highlight

set nocompatible          "won't be compatible with Vi
set noshowmode              "message on status line to show current mode
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
set ruler
set termguicolors
set colorcolumn=120

" Theme
try | colorscheme gruvbox | catch | endtry

" Search
set showmatch
set nohlsearch
set incsearch
set ignorecase
set smartcase

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

" Leader
let mapleader=" "

" Basic mappings
nnoremap <Leader>ev :vs $MYVIMRC<cr>
nnoremap <Leader>sv :so $MYVIMRC<cr>

"""""""""""""
"  Plugins  "
"""""""""""""
" VIMWIKI
let g:vimwiki_markdown_link_ext = 1

let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                    \ 'syntax': 'markdown', 'ext': '.md'}]

let g:calendar_diary='~/Documents/vimwiki/diary'
let g:vimwiki_global_ext=0

" FZF
nmap <C-P> :Files<cr>
"""""""""""""

" UNDOTREE
nnoremap <Leader>u :UndotreeToggle<cr>

" AIRLINE
let g:airline_theme= 'gruvbox'
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""
"  Advanced Configuration  "
""""""""""""""""""""""""""""
" Switch off arrow keys
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
  exec 'cnoremap' key '<Nop>'
endfor
