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
        { "<Leader>zm", "<Cmd>ZenMode<CR>", desc = "[Z]en [M]ode Toggle" },
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
            alacritty = {
                enabled = true,
            }
        },
    },
}
