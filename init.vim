"   _____ _____
"  |  _  |   __|  Piotr Serafin
"  |   __|__   |  https://piotrserafin.dev
"  |__|  |_____|  https://github.com/piotrserafin
"

"""""""""""""
"  Imports  "
"""""""""""""
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/general/settings.vim

lua require("ps")

"""""""""""""""""
"  Keymappings  "
"""""""""""""""""
" Basic mappings
nnoremap <Leader>sv :so $MYVIMRC<CR>

" Remap  to Esc
inoremap <silent> ii <Esc>

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

" Line movement
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"""""""""""""""""
"  Autocommand  "
"""""""""""""""""
autocmd FileType markdown set conceallevel=0

augroup PS
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END
