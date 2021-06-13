--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local dap = require('dap')

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

