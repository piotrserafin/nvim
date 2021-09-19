--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

-- MARKDOWN PREVIEW
vim.g.mkdp_refresh_slow = 1

local map = require('utils').map

-- Toggle Markdown Preview in Browser
map('n', '<Leader>mp', ':MarkdownPreviewToggle<CR>')
