--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffers navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Basic mappings
keymap('n', '<Leader>sv', ':so $MYVIMRC<CR>', { noremap = true })

-- Yank till end of line (make Y behave like D,C, etc.)
keymap('n', 'Y', 'y$', opts)

-- Remap to avoid hitting shift when entering command mode
keymap('n', ';', ':', { noremap = true })
keymap('v', ';', ':', { noremap = true })

-- Paste last thing yanked, not deleted
keymap('n', ',p', '"0p', { noremap = true })
keymap('n', ',P', '"0P', { noremap = true })

-- Line movement
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
