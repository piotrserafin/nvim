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
let g:vimwiki_folding=''

" FZF
nmap <C-P> :Files<cr>
"""""""""""""

""""""""""""""""""""""""""""
"  Advanced Configuration  "
""""""""""""""""""""""""""""
" Switch off arrow keys
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
  exec 'cnoremap' key '<Nop>'
endfor

" Add empty line in normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

nmap <Leader><F12> :Glow<CR>
nmap <F10> :Goyo<CR>
