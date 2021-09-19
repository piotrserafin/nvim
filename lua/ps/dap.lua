--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local dap = require('dap')
local map = require('utils').map

dap.defaults.fallback.external_terminal = {
    command = '/usr/local/bin/alacritty';
    args = {'-e'};
}

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/local/Cellar/llvm/12.0.1/bin/lldb-vscode',
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

map('n', '<F9>'      , ":lua require'dap'.toggle_breakpoint()<CR>")
map('n', '<S-F11>'   , ":lua require'dap'.step_out()<CR>")
map('n', '<F11>'     , ":lua require'dap'.step_into()<CR>")
map('n', '<F10>'     , ":lua require'dap'.step_over()<CR>")
map('n', '<Leader>ds', ":lua require'dap'.stop()<CR>")
map('n', '<Leader>dn', ":lua require'dap'.continue()<CR>")
map('n', '<Leader>dk', ":lua require'dap'.up()<CR>")
map('n', '<Leader>dj', ":lua require'dap'.down()<CR>")
map('n', '<Leader>d_', ":lua require'dap'.run_last()<CR>")
map('n', '<Leader>dr', ":lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>")
map('n', '<Leader>di', ":lua require'dap.ui.widgets'.hover()<CR>")
map('n', '<Leader>di', ":lua require'dap.ui.variables'.visual_hover()<CR>")
map('n', '<Leader>d?', ":lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")
map('n', '<Leader>de', ":lua require'dap'.set_exception_breakpoints({\"all\"})<CR>")

vim.g.dap_virtual_text = true
