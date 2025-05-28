--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "saghen/blink.cmp",
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        {
            "j-hui/fidget.nvim",
            opts = {
                notification = {
                    window = {
                        winblend = 0,
                    },
                },
            },
        },
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "bashls",
                "gopls",
                "rust_analyzer",
                "pyright",
            },
            automatic_enable = false,
        })

        vim.lsp.enable({ "lua_ls" })
        vim.lsp.enable("bashls")
        vim.lsp.enable("gopls")
        vim.lsp.enable("rust_analyzer")
        vim.lsp.enable("pyright")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
        vim.lsp.config("*", {
            capabilities = capabilities,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local nmap = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "Lsp: " .. desc })
                end

                nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
                nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                nmap("gR", vim.lsp.buf.references, "[G]oto [R]eferences")
                nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
                nmap("go", vim.lsp.buf.type_definition, "Type [D]efinition")
                nmap("<Leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                nmap("<Leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
                nmap("K", vim.lsp.buf.hover, "Hover Documentation")
                nmap("gs", vim.lsp.buf.signature_help, "Signature Documentation")
                vim.keymap.set(
                    "v",
                    "<leader>ca",
                    vim.lsp.buf.code_action,
                    { buffer = ev.buf, desc = "Lsp: code_action" }
                )
            end,
        })
    end,
}
