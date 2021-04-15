"#   _____ _____
"#  |  _  |   __|  Piotr Serafin
"#  |   __|__   |  https://piotrserafin.dev
"#  |__|  |_____|  https://github.com/piotrserafin
"#

"""""""""""""
"  Imports  "
"""""""""""""
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/general/settings.vim

"""""""""""""
"  Plugins  "
"""""""""""""
" VIMWIKI
let personal = {}
let personal.path = '~/Documents/vimwiki/personal.wiki/'
let personal.syntax = 'markdown'
let personal.ext = '.md'
let personal.auto_diary_index = 1 

let work = {}
let work.path = '~/Documents/vimwiki/work.wiki/'
let work.syntax = 'markdown'
let work.ext = '.md'
let work.auto_diary_index = 1 

let g:vimwiki_list = [personal, work]
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_folding = ''
let g:vimwiki_dir_link = 'index'

" CALENDAR + VIMWIKI
let g:calendar_diary = '~/Documents/vimwiki/work.wiki/diary'

" INSTANT MARKDOWN
let g:instant_markdown_slow = 1

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>

" ULTISNIPS
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"""""""""""""""""
"  Keymappings  "
"""""""""""""""""
" Basic mappings
nnoremap <Leader>ev :vs $MYVIMRC<CR>
nnoremap <Leader>sv :so $MYVIMRC<CR>

" Remap jk,kj to Esc
inoremap jk <Esc>
inoremap kj <Esc>

" Remap to avoid hitting shift when entering command mode
nnoremap ; :
vnoremap ; :

" Paste last thing yanked, not deleted
nnoremap ,p "0p
nnoremap ,P "0P

" Move between Vimdows 
nnoremap <up> <C-w><up>
nnoremap <down> <C-w><down>
nnoremap <left> <C-w><left>
nnoremap <right> <C-w><right>

" Add empty line in normal mode
nnoremap <S-Enter> O<Esc>
noremap <CR> o<Esc>

" Toggle Glow Preview
nnoremap <Leader><F12> :Glow<CR>

" Toggle Zen Mode 
nnoremap <F10> :Goyo<CR>

" Toggle Markdown Preview in Browser
nnoremap <Leader>mp :MarkdownPreviewToggle<CR>

"""""""""""""""""
"  Autocommand  "
"""""""""""""""""
autocmd FileType markdown set conceallevel=0

