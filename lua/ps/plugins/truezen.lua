--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--
return {
    "Pocco81/TrueZen.nvim",
    keys = {
        { "<Leader>zf", "<Cmd>TZFocus<CR>", desc = "Toggle Focus Zen" },
        { "<Leader>za", "<Cmd>TZAtaraxis<CR>", desc = "Toggle Ataraxis Zen" },
        { "<Leader>zm", "<Cmd>TZMinimalist<CR>", desc = "Toggle Minimalist Zen" },
    },
    opts = {
        integrations = {
            tmux = true,
            lualine = true,
        },
    },
}
