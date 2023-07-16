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
        lazy = false,
        init = function()
            vim.g.vimwiki_list = {
                {
                    path = "~/org/vimwiki/personal.wiki",
                    syntax = "markdown",
                    ext = ".md",
                    auto_diary_index = 1,
                    auto_toc = 1,
                },
                {
                    path = "~/org/vimwiki/work.wiki",
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
        lazy = false,
        init = function()
            vim.g.taskwiki_taskrc_location = "~/.config/task/taskrc"
            vim.g.taskwiki_data_location = "~/org/task"
        end,
    },
}
