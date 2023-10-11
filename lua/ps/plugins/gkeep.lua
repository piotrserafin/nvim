--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "stevearc/gkeep.nvim",
    build = ":UpdateRemotePlugins",
    lazy = false,
    keys = {
        { "<Leader>gk", "<Cmd>GkeepToggle<CR>", desc = "[G][K]eep Toogle" },
    },
}
