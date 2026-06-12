--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

require("catppuccin").setup({
    flavour = "mocha",
    background = {
        light = "latte",
        dark = "mocha",
    },
    integrations = {
        fzf = true,
        treesitter = true,
        notify = false,
        mini = { enabled = false },
        fidget = true,
    },
})
vim.cmd.colorscheme("catppuccin-mocha")
