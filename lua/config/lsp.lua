--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

vim.lsp.enable("lua_ls")
vim.lsp.enable("bashls")
vim.lsp.enable("pyright")
vim.lsp.enable("gopls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("marksman")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
            return
        end

        -- Enable builtin completion
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

-- Diagnostics
vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
})
