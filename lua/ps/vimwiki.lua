--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--


-- VIMWIKI
vim.g.vimwiki_list = {
    {
        path = '~/Documents/vimwiki/personal.wiki/',
        syntax = 'markdown',
        ext = '.md',
        auto_diary_index = 1,
        auto_toc = 1
    },
    {
        path = '~/Documents/vimwiki/work.wiki/',
        syntax = 'markdown',
        ext = '.md',
        auto_diary_index = 1,
        auto_toc = 1
    }
}

vim.g.vimwiki_markdown_link_ext = 1
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_folding = 'custom'
vim.g.vimwiki_dir_link = 'index'

-- CALENDAR + VIMWIKI
vim.g.calendar_diary = '~/Documents/vimwiki/work.wiki/diary'

vim.cmd([[
au BufNewFile ~/Documents/vimwiki/work.wiki/diary/*.md :silent 0r !~/.config/nvim/scripts/generate-vimwiki-diary-template '%'
]])
