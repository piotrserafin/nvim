--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "akinsho/toggleterm.nvim",
    keys = {
        { "<Leader>tt", "<Cmd>ToggleTerm<CR>", desc = "Toogle Term" },
    },
    opts = {
        open_mapping = [[<c-\>]],
        direction = "float",
        float_opts = {
            border = "single",
            winblend = 3,
        },
    },
}
