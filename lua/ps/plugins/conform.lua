--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "stevearc/conform.nvim",
    lazy = true,
    cmd = "ConformInfo",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                sh = { "beautysh" },
                zsh = { "beautysh" },
                bash = { "beautysh" },
                python = { "black" },
                c = { "clang-format" },
                cpp = { "clang-format" },
            },
            format_on_save = function(bufnr)
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return { timeout_ms = 500, lsp_format = "fallback" }
            end,
        })

        vim.api.nvim_create_user_command("FormatDisable", function(args)
            if args.bang then
                -- FormatDisable! will disable formatting just for this buffer
                vim.b.disable_autoformat = true
            else
                vim.g.disable_autoformat = true
            end
        end, {
            desc = "Disable autoformat-on-save",
            bang = true,
        })

        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
        end, {
            desc = "Re-enable autoformat-on-save",
        })

        vim.keymap.set({ "n", "v" }, "<Leader>cf", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format: [C]ode [F]ormat" })
    end,
}
