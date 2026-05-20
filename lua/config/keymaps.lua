--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Switch focus left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Switch focus down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Switch focus up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Switch focus right" })

vim.keymap.set("n", "<S-l>", "<Cmd>bnext<CR>", { silent = true, desc = "Buffer next" })
vim.keymap.set("n", "<S-h>", "<Cmd>bprevious<CR>", { silent = true, desc = "Buffer previous" })

vim.keymap.set("n", ";", ":", { desc = "Command mode" })
vim.keymap.set("v", ";", ":", { desc = "Command mode" })
vim.keymap.set("n", ",p", '"0p', { desc = "Paste last thing yanked" })
vim.keymap.set("n", ",P", '"0P', { desc = "Paste last thing yanked" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move line up" })

-- Quickly source current file / execute Lua code
vim.keymap.set("n", "<leader>xx", "<Cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<leader>x", "<Cmd>:.lua<CR>", { desc = "Lua: execute current line" })
vim.keymap.set("v", "<leader>x", "<Cmd>:lua<CR>", { desc = "Lua: execute current selection" })
