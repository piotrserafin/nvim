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

lua require("ps")

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

" MARKDOWN PREVIEW
let g:mkdp_refresh_slow = 1
let g:mkdp_browser = 'qutebrowser'

" ULTISNIPS
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["snips"]

" TREESITTER
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" LSP
set completeopt=menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" LIMELIGHT + GOYO
let g:goyo_width = 120
let g:limelight_default_coefficient = 0.8

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

" Toggle Zen Mode
nnoremap <leader>G :Goyo<CR>

" Toggle Markdown Preview in Browser
nnoremap <Leader>mp :MarkdownPreviewToggle<CR>

" Telescope
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>vrc :lua require('ps.telescope').search_dotfiles()<CR>

" Line movement
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"""""""""""""""
"  Functions  "
"""""""""""""""
function! s:goyo_enter()
  if exists('$TMUX')
    silent !tmux set status off
  endif
  Limelight
endfunction

function! s:goyo_leave()
  if exists('$TMUX')
    silent !tmux set status on
  endif
  Limelight!
endfunction

"""""""""""""""""
"  Autocommand  "
"""""""""""""""""
autocmd FileType markdown set conceallevel=0

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

augroup PS
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END
