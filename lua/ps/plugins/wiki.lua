--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    -- Vimwiki
    {
        "vimwiki/vimwiki",
        branch = "dev",
        ft = "vimwiki",
        lazy = true,
        cmd = { "VimwikiIndex", "VimwikiDiaryIndex" },
        keys = {
            { "<Leader>ww", "<Plug>VimwikiIndex<CR>", desc = "Vimwiki Index" },
            { "<Leader>wi", "<Plug>VimwikiDiaryIndex<CR>", desc = "Vimwiki Diary Index" },
        },
        init = function()
            vim.g.vimwiki_list = {
                {
                    path = os.getenv("VIMWIKI_PERSONAL"),
                    syntax = "markdown",
                    ext = ".md",
                    auto_diary_index = 1,
                    auto_toc = 1,
                },
                {
                    path = os.getenv("VIMWIKI_WORK"),
                    syntax = "markdown",
                    ext = ".md",
                    auto_diary_index = 1,
                    auto_toc = 1,
                },
            }

            vim.g.vimwiki_global_ext = 0 -- Do not treat md files outside of vimwiki path as wiki
            vim.g.vimwiki_folding = "custom" -- Folding managed externally
            vim.g.vimwiki_dir_link = "index"
            vim.g.vimwiki_markdown_link_ext = 1
        end,
    },
    -- Taskwiki
    {
        "tools-life/taskwiki",
        ft = "vimwiki",
        lazy = true,
        init = function()
            vim.g.taskwiki_taskrc_location = "~/.config/task/taskrc"
            vim.g.taskwiki_data_location = "~/org/task"
        end,
    },
}
