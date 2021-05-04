"#   _____ _____
"#  |  _  |   __|  Piotr Serafin
"#  |   __|__   |  https://piotrserafin.dev
"#  |__|  |_____|  https://github.com/piotrserafin
"#

call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" Statusbar
Plug 'itchyny/lightline.vim'

" Focus Mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" UltiSnips
Plug 'SirVer/ultisnips'

" Vimwiki & Taskworrior & Calendar
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'tools-life/taskwiki'
Plug 'mattn/calendar-vim'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Tmux syntax highlight
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'

" TPope essentials
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'simrat39/symbols-outline.nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Colorizer
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

