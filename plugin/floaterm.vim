"   _____ _____
"  |  _  |   __|  Piotr Serafin
"  |   __|__   |  https://piotrserafin.dev
"  |__|  |_____|  https://github.com/piotrserafin
"
let g:floaterm_width = 0.95
let g:floaterm_height = 0.95

let g:floaterm_keymap_new    = '<leader>tn'
let g:floaterm_keymap_toggle = '<leader>tt'
let g:floaterm_keymap_kill   = '<leader>tk'

nnoremap <leader>tp <cmd>FloatermNew python3<cr>
nnoremap <leader>tl <cmd>FloatermNew lua<cr>
