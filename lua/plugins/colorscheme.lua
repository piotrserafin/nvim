--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            integrations = {
                fzf = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = false,
                },
                fidget = true,
            },
        })

        vim.cmd("colorscheme catppuccin-mocha")

        vim.opt.termguicolors = true
        vim.opt.background = "dark"
    end,
}
