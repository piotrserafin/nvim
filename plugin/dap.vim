"   _____ _____
"  |  _  |   __|  Piotr Serafin
"  |   __|__   |  https://piotrserafin.dev
"  |__|  |_____|  https://github.com/piotrserafin
"

nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<cr>
nnoremap <S-k> :lua require'dap'.step_out()<cr>
nnoremap <S-l> :lua require'dap'.step_into()<cr>
nnoremap <S-j> :lua require'dap'.step_over()<cr>
nnoremap <leader>ds :lua require'dap'.stop()<cr>
nnoremap <leader>dn :lua require'dap'.continue()<cr>
nnoremap <leader>dk :lua require'dap'.up()<cr>
nnoremap <leader>dj :lua require'dap'.down()<cr>
nnoremap <leader>d_ :lua require'dap'.run_last()<cr>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<cr><C-w>l
nnoremap <leader>di :lua require'dap.ui.widgets'.hover()<cr>
vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<cr>
nnoremap <leader>d? :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<cr>
nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<cr>

let g:dap_virtual_text = v:true
