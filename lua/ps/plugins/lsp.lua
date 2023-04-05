--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    -- Lsp Zero
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            { "neovim/nvim-lspconfig" },
            {
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" },

            -- dap
            -- { "mfussenegger/nvim-dap" },
            -- { "jay-babu/mason-nvim-dap.nvim" },
        },
        config = function()
            local lsp = require("lsp-zero")

            lsp.preset("lsp-only")

            lsp.ensure_installed({
                "lua_ls",
                "bashls",
                "rust_analyzer",
            })

            lsp.on_attach(function(client, bufnr)
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
            end)

            lsp.skip_server_setup({ "rust_analyzer" })

            lsp.nvim_workspace()

            lsp.format_mapping("<F3>", {
                format_opts = {
                    async = false,
                    timeout_ms = 10000,
                },
                servers = {
                    ["null-ls"] = { "lua", "rust" },
                },
            })

            lsp.format_on_save({
                format_opts = {
                    timeout_ms = 10000,
                },
                servers = {
                    ["null-ls"] = { "lua", "rust" },
                },
            })

            lsp.setup()

            -- require("mason-nvim-dap").setup({
            --     ensure_installed = { "bash" },
            -- })
            --
            -- require("mason-nvim-dap").setup_handlers({})
        end,
    },
    -- Rust
    {
        "simrat39/rust-tools.nvim",
        config = true,
    },
    -- Null-ls
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            local null_ls = require("null-ls")

            require("mason-null-ls").setup({
                ensure_installed = {
                    "stylua",
                    "beautysh",
                    "rustfmt",
                },
                automatic_installation = true,
                automatic_setup = false,
            })

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
                    null_ls.builtins.formatting.beautysh,
                    null_ls.builtins.formatting.rustfmt,
                },
            })
        end,
    },
    -- Fidget
    {
        "j-hui/fidget.nvim",
        config = true,
    },
}
