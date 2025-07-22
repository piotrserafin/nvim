--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "m4xshen/hardtime.nvim",
    lazy = true,
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "Hardtime",
    keys = {
        { "<Leader>ht", "<Cmd>Hardtime toggle<CR>", { noremap = true, silent = true, desc = "Toggle [H]ard[T]ime" } },
    },
    opts = {},
}
