--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local dap = require('dap')

dap.defaults.fallback.external_terminal = {
    command = '/usr/local/bin/alacritty';
    args = {'-e'};
}

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/local/Cellar/llvm/12.0.0_1/bin/lldb-vscode',
    name = 'lldb'
}

dap.configurations.c = {
    {
        name = 'Launch (C)',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        runInTerminal = true,
    }
}

vim.cmd([[
nnoremap <F9>       :lua require'dap'.toggle_breakpoint()<cr>
nnoremap <S-F11>    :lua require'dap'.step_out()<cr>
nnoremap <F11>      :lua require'dap'.step_into()<cr>
nnoremap <F10>      :lua require'dap'.step_over()<cr>
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
]])

vim.g.dap_virtual_text = true
