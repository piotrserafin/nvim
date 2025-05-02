--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

-------------------
--  Autocommands  -
-------------------
local user_commands = vim.api.nvim_create_augroup("General settings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*.puml",
    command = "set filetype=puml",
    group = user_commands,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.tf", "*.tfvars" },
    callback = function()
        vim.lsp.buf.format()
    end,
})

vim.diagnostic.config({ virtual_lines = { current_line = true } })
