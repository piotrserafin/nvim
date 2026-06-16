--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

-- Parser installation
local ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "html",
    "http",
    "javascript",
    "jq",
    "json",
    "latex",
    "lua",
    "xml",
    "graphql",
    "make",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "rust",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
    "sql",
    "go",
}

require("nvim-treesitter").setup({})

local installed = require("nvim-treesitter").get_installed()
local to_install = vim.tbl_filter(function(lang)
    return not vim.tbl_contains(installed, lang)
end, ensure_installed)

if #to_install > 0 then
    require("nvim-treesitter").install(to_install)
end
