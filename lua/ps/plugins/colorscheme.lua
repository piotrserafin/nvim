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
        local cmd = vim.cmd
        local opt = vim.opt
        local g = vim.g

        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            integrations = {
                -- cmp = true,
                blink_cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = false,
                },
                telescope = {
                    enabled = true,
                },
                mason = true,
                which_key = true,
                fidget = true,
            },
        })

        cmd("colorscheme catppuccin-mocha")

        opt.termguicolors = true
        opt.background = "dark"
    end,
}
