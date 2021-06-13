"   _____ _____
"  |  _  |   __|  Piotr Serafin
"  |   __|__   |  https://piotrserafin.dev
"  |__|  |_____|  https://github.com/piotrserafin
"

" telescope
nnoremap <C-p> :lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<cr>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fd :lua require('ps.telescope').search_dotfiles()<cr>
nnoremap <leader>fv :lua require('ps.telescope').search_vimwiki()<cr>

" telescope-dap
nnoremap <leader>df :lua require('telescope').extensions.dap.frames()<cr>
nnoremap <leader>dc :lua require('telescope').extensions.dap.configurations()<cr>
nnoremap <leader>db :lua require('telescope').extensions.dap.list_breakpoints()<cr>
nnoremap <leader>dv :lua require('telescope').extensions.dap.variables()<cr>
