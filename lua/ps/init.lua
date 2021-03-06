--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

require("ps.utils")
require("ps.lsp")
require("ps.cmp")
require("ps.telescope")
require("ps.colorizer")
require("ps.treesitter")
require("ps.rest")
require("ps.dap")
require("ps.nvimtree")
require("ps.comment")
require("ps.truezen")
require("ps.toggleterm")
require("ps.lualine")
require("ps.startup")
require("ps.gitsigns")
require("ps.luasnip")

if require("ps.utils").is_darwin() then
    require("ps.mkdp")
    require("ps.vimwiki")
    require("ps.gkeep")
end
