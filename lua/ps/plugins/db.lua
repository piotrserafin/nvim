--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        { "tpope/vim-dadbod", lazy = true },
        { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
    },
    keys = {
        { "<Leader>qq", "<Cmd>DBUIToggle<CR>", desc = "DB Explorer Toggle" },
    },
    config = function()
        vim.g.db_ui_show_help = 0
        vim.g.db_ui_winwidth = 50
        vim.g.db_ui_save_location = os.getenv("NVIM_DBUI_CONFIG")
    end,
}
