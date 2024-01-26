--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        config = function(_, opts)
            local wk = require("which-key")

            wk.setup(opts)

            local mappings = {
                o = { name = "[O]bsidian" },
                f = { name = "[F]ind with Telescope" },
                c = { name = "[C]ode edit" },
                r = { name = "[R]est Request" },
                q = { name = "DB" },
            }

            local opt = {
                mode = "n", -- NORMAL mode
                prefix = "<leader>",
            }

            wk.register(mappings, opt)
        end,
    },
}
