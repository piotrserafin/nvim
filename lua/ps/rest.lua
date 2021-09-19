--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

require('rest-nvim').setup({
    result_split_horizontal = false,
    skip_ssl_verification = false
})

local map = require('utils').map
local opts  = { noremap = false }

map('n', '<Leader>rr', '<Plug>RestNvim<CR>', opts)
map('n', '<Leader>rp', '<Plug>RestNvimPreview<CR>', opts)
map('n', '<Leader>rl', '<Plug>RestNvimLast<CR>', opts)
