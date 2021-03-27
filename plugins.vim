"#   _____ _____
"#  |  _  |   __|  Piotr Serafin
"#  |   __|__   |  https://piotrserafin.dev
"#  |__|  |_____|  https://github.com/piotrserafin
"#

call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Vimwiki & Taskworrior
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'tools-life/taskwiki'
Plug 'mattn/calendar-vim'

" Tmux
Plug 'tmux-plugins/vim-tmux'

" TPope essentials
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

" FZF stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mbbill/undotree'

call plug#end()

