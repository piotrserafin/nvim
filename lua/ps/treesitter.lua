--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
parser_configs.http = {
  install_info = {
    url = "https://github.com/NTBBloodbath/tree-sitter-http",
    files = { "src/parser.c" },
    branch = "main",
  },
}

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash',
        'c',
        'cpp',
        'rust',
        'python',
        'lua',
        'json',
        'dockerfile',
        'nix',
        'yaml',
        'html',
        'javascript',
        'typescript',
        'css',
        'http'
    },
    highlight = {
        enable = true
    },
    playground = {
        enable = true
    }
})
