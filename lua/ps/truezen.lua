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
		lualine = true,
	},
})

vim.api.nvim_set_keymap('n', "<C-F12>", "<Cmd>TZAtaraxis<CR>"  , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<S-F12>", "<Cmd>TZMinimalist<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<F12>"  , "<Cmd>TZFocus<CR>"     , { noremap = true, silent = true })
