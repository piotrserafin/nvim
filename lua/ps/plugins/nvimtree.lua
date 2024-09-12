--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    lazy = true,
    cmd = "NvimTreeToggle",
    keys = {
        { "<C-n>", "<Cmd>NvimTreeToggle<CR>", desc = "Focus on file explorer" },
    },
    opts = {
        view = {
            width = 60,
        },
        filters = {
            custom = { "^.git$" },
        },
    },
}
