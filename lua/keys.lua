--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

vim.g.mapleader = ' '

------------------
--  Keymappings  -
------------------
local map = require('utils').map

-- Basic mappings
map('n', '<leader>sv', ':so $MYVIMRC<cr>')

-- Yank till end of line (make Y behave like D,C, etc.)
map('n', 'Y', 'y$')

-- Remap to avoid hitting shift when entering command mode
map('n', ';', ':')
map('v', ';', ':')

-- Paste last thing yanked, not deleted
map('n', ',p', '"0p')
map('n', ',P', '"0P')

-- Line movement
map('v', 'J', ':m \'>+1<CR>gv=gv')
map('v', 'K', ':m \'<-2<CR>gv=gv')
