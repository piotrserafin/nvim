--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

-------------------
--  Autocommands  -
-------------------
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("PS", { clear = true }),
    pattern = "*",
    command = "%s/\\s\\+$//e"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    command = "set conceallevel=0"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "vimwiki",
    command = "set conceallevel=0"
})
