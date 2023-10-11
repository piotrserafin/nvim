--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Switch focus left" })
keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Switch focus down" })
keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Switch focus up" })
keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Switch focus right" })

keymap("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true, desc = "Buffer next" })
keymap("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Buffer previous" })

keymap("n", "<Leader>sv", ":so $MYVIMRC<CR>", { noremap = true, desc = "Reload config" })

keymap("n", "Y", "y$", { noremap = true, silent = true, desc = "Yank till end of line" })

keymap("n", ";", ":", { noremap = true, desc = "Command mode" })
keymap("v", ";", ":", { noremap = true, desc = "Command mode" })

keymap("n", ",p", '"0p', { noremap = true, desc = "Paste last thing yanked" })
keymap("n", ",P", '"0P', { noremap = true, desc = "Paste last thing yanked" })

keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move line down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move line up" })
