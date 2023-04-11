--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--
return {
    "folke/zen-mode.nvim",
    dependencies = {
        "folke/twilight.nvim",
    },
    keys = {
        { "<Leader>zm", "<Cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
    },
    opts = {
        window = {
            options = {
                signcolumn = "no",
                relativenumber = true,
            },
        },
        plugins = {
            twilight = {
                enabled = true,
            },
            tmux = {
                enabled = true,
            },
        },
    },
}
