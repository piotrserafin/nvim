--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local opt = vim.opt
local indent = 4

--------------------------
--  Basic Configuration  -
--------------------------

-- Basic
cmd "syntax enable"     -- enable syntax highlight

vim.cmd([[
set path+=**

set noshowmode            "no message on status line to show current mode
set showcmd               "show (partial) command in status line
set mouse=a               "enable the use of mouse clicks for all modes

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
set nofoldenable          "When off, all folds are open
set scrolloff=8
set signcolumn=yes
set shortmess+=c          "don't give ins-completion-menu messages.

" Theme
if has('termguicolors')
  set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_palette = 'material'
colorscheme gruvbox-material
let g:lightline = {'colorscheme' : 'gruvbox_material'}

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

set wildmode=longest,list,full
set wildmenu

set hidden
set clipboard+=unnamedplus  "copy pase between nvim and everything else
set guicursor=              "disuable cursor styling (box)
]])
