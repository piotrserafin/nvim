--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
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
        local on_attach = function(_, bufnr)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = "LSP: " .. desc
                end
                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            end

            nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
            nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
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
            nmap("<Leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
            nmap("<Leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
            nmap("<Leader>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, "[W]orkspace [L]ist Folders")
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        require("mason").setup({})

        local handlers = {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function(server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end,
            -- Next, you can provide targeted overrides for specific servers.
            ["lua_ls"] = function()
                local runtime_path = vim.split(package.path, ";")
                table.insert(runtime_path, "lua/?.lua")
                table.insert(runtime_path, "lua/?/init.lua")

                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        Lua = {
                            -- Disable telemetry
                            telemetry = { enable = false },
                            runtime = {
                                -- Tell the language server which version of Lua you're using
                                -- (most likely LuaJIT in the case of Neovim)
                                version = "LuaJIT",
                                path = runtime_path,
                            },
                            diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = { "vim" },
                            },
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    -- Make the server aware of Neovim runtime files
                                    vim.fn.expand("$VIMRUNTIME/lua"),
                                    vim.fn.stdpath("config") .. "/lua",
                                },
                            },
                        },
                    },
                })
            end,
        }

        require("neodev").setup({})

        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "bashls",
                "gopls",
                "rust_analyzer",
            },
            handlers = handlers,
        })
    end,
}
