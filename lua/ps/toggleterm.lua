--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    open_mapping = [[<c-\>]],
    direction = "float",
    float_opts = {
        border = "single",
        winblend = 3,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<Leader>tg", "<cmd>lua _lazygit_toggle()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>tt", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })
