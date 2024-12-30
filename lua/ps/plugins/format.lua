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
                css = { "prettier" },
                html = { "tidy" },
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
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
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
