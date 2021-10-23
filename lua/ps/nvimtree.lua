--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

require('nvim-tree').setup({
    view = {
        width = 40
    }
})


local map = require('utils').map

map('n', '<C-n>', ':NvimTreeToggle<CR>')
