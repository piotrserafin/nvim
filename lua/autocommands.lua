--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

-------------------
--  Autocommands  -
-------------------
vim.cmd([[
autocmd FileType markdown set conceallevel=0
autocmd FileType vimwiki set conceallevel=0

augroup PS
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END
]])

