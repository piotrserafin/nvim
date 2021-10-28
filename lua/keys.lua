--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
------------------
--  Keymappings  -
------------------
-- Basic mappings
vim.api.nvim_set_keymap('n', '<Leader>sv', ':so $MYVIMRC<CR>', { noremap = true })

-- Yank till end of line (make Y behave like D,C, etc.)
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = true })

-- Remap to avoid hitting shift when entering command mode
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('v', ';', ':', { noremap = true })

-- Paste last thing yanked, not deleted
vim.api.nvim_set_keymap('n', ',p', '"0p', { noremap = true })
vim.api.nvim_set_keymap('n', ',P', '"0P', { noremap = true })

-- Line movement
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
