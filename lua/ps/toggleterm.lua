--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

require('toggleterm').setup({
    open_mapping = [[<c-\>]],
    direction = 'float',
    float_opts = {
        border = 'single',
        winblend = 3,
        highlights = {
            border = "Normal",
            background = "Normal",
        }
    }
})

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

local map = require('utils').map
local opts = { noremap = true, silent = true }

map('n', '<Leader>tg', '<cmd>lua _lazygit_toggle()<cr>', opts)
map('n', '<Leader>tt', '<cmd>ToggleTerm<cr>', opts)
