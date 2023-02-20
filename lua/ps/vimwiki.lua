--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

-- VIMWIKI
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

vim.g.vimwiki_markdown_link_ext = 1
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_folding = "custom"
vim.g.vimwiki_dir_link = "index"

-- CALENDAR + VIMWIKI
vim.g.calendar_diary = "~/org/vimwiki/work.wiki/diary"

-- TASKWIKI
vim.g.taskwiki_taskrc_location = "~/.config/task/taskrc"
vim.g.taskwiki_data_location = "~/org/task"
