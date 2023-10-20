--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    {
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
        init = function()
            vim.g.db_ui_show_help = 0
            vim.g.db_ui_winwidth = 50
            vim.g.db_ui_save_location = os.getenv("NVIM_DBUI_CONFIG")

            local function db_completion()
                require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
            end

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "sql",
                },
                command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "sql",
                    "mysql",
                    "plsql",
                },
                callback = function()
                    vim.schedule(db_completion)
                end,
            })
        end,
    },
}
