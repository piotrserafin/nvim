--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

require("hardtime").setup({
    enabled = false,
})

vim.keymap.set("n", "<Leader>ht", "<Cmd>Hardtime toggle<CR>", { silent = true, desc = "Toggle [H]ard[T]ime" })
