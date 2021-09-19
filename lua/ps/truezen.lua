--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

require('true-zen').setup({
	ui = {
		left = {
			number = true,
			relativenumber = true,
		},
	},
	integrations = {
		tmux = true,
		lightline = true,
	},
})

local map = require('utils').map

map('n', '<C-F12>', "<Cmd>TZAtaraxis<CR>")
map('n', '<S-F12>', "<Cmd>TZMinimalist<CR>")
map('n', '<F12>'  , "<Cmd>TZFocus<CR>")


