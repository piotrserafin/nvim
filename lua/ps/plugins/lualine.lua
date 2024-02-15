--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "hoob3rt/lualine.nvim",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
    },
    opts = {
        options = {
            theme = "catppuccin-mocha",
        },
        extensions = { "nvim-tree" },
        -- Commented as this forces rest.nvim to load at startup
        -- sections = {
        --     lualine_x = {
        --         "rest",
        --     },
        -- },
    },
}
