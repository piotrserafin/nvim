--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>gk", ":GkeepToggle<cr>", opts)
