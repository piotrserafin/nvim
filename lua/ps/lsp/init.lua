--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("ps.lsp.handlers").setup()
require("ps.lsp.lsp_installer")
require("ps.lsp.lspkind")
require("ps.lsp.symbols_outline")
require("ps.lsp.null_ls")
require("ps.lsp.fidget")
