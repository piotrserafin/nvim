--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end

local dap_virtual_text_status_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not dap_virtual_text_status_ok then
    return
end

dap.defaults.fallback.external_terminal = {
    command = "/usr/local/bin/alacritty",
    args = { "-e" },
}

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/local/Cellar/llvm/13.0.1/bin/lldb-vscode",
    name = "lldb",
}

dap.configurations.c = {
    {
        name = "Launch (C)",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = true,
    },
}

dap_virtual_text.setup()

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-F11>", ":lua require'dap'.step_out()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>ds", ":lua require'dap'.stop()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dn", ":lua require'dap'.continue()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dk", ":lua require'dap'.up()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dj", ":lua require'dap'.down()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>d_", ":lua require'dap'.run_last()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dr", ":lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>", opts)
vim.api.nvim_set_keymap("n", "<Leader>di", ":lua require'dap.ui.widgets'.hover()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>di", ":lua require'dap.ui.variables'.visual_hover()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>de", ":lua require'dap'.set_exception_breakpoints({\"all\"})<CR>", opts)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>d?",
    ":lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>",
    opts
)
