--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

require'nvim-treesitter.configs'.setup {
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
        'css'
    },
    highlight = {
        enable = true
    },
    playground = {
        enable = true
    }
}
