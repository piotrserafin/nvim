--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

-- MARKDOWN PREVIEW
vim.g.mkdp_refresh_slow = 1

-- Toggle Markdown Preview in Browser
vim.api.nvim_set_keymap("n", "<Leader>mp", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
