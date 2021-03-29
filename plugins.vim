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

" Visual mode
Plug 'junegunn/goyo.vim'

" Vimwiki & Taskworrior
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'tools-life/taskwiki'
Plug 'mattn/calendar-vim'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'}

" Tmux syntax highlight
Plug 'tmux-plugins/vim-tmux'

" Color name highlighter
Plug 'ap/vim-css-color'

" TPope essentials
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

" FZF stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

