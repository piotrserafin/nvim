--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "saghen/blink.cmp",
    version = "*",
    dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
    enabled = true,
    opts = {
        snippets = { preset = "luasnip" },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer", "markdown" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    enabled = true,
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
                lsp = {
                    name = "lsp",
                    enabled = true,
                    module = "blink.cmp.sources.lsp",
                    fallbacks = { "snippets", "buffer" },
                    score_offset = 90,
                },
                path = {
                    name = "path",
                    module = "blink.cmp.sources.path",
                    score_offset = 3,
                    fallbacks = { "snippets", "buffer" },
                    opts = {
                        trailing_slash = false,
                        label_trailing_slash = true,
                        get_cwd = function(context)
                            return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
                        end,
                        show_hidden_files_by_default = true,
                    },
                },
                buffer = {
                    name = "buffer",
                    enabled = true,
                    max_items = 10,
                    module = "blink.cmp.sources.buffer",
                    min_keyword_length = 5,
                },
                markdown = {
                    name = "RenderMarkdown",
                    module = "render-markdown.integ.blink",
                    fallbacks = { "lsp" },
                },
                -- dadbod = {
                --     name = "dadbod",
                --     module = "vim_dadbod_completion.blink",
                --     score_offset = 85,
                -- },
            },
        },
    },
}
