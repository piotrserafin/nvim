--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
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
