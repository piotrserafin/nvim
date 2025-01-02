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
        sources = {
            default = { "lazydev", "lsp", "luasnip", "path", "snippets", "buffer" },
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
                    fallbacks = { "snippets", "luasnip", "buffer" },
                    score_offset = 90,
                },
                path = {
                    name = "path",
                    module = "blink.cmp.sources.path",
                    score_offset = 3,
                    fallbacks = { "snippets", "luasnip", "buffer" },
                    opts = {
                        trailing_slash = false,
                        label_trailing_slash = true,
                        get_cwd = function(context)
                            return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
                        end,
                        show_hidden_files_by_default = true,
                    },
                },
                snippets = {
                    name = "snippets",
                    enabled = true,
                    max_items = 10,
                    module = "blink.cmp.sources.snippets",
                    min_keyword_length = 4,
                    score_offset = 80,
                },
                buffer = {
                    name = "buffer",
                    enabled = true,
                    max_items = 10,
                    module = "blink.cmp.sources.buffer",
                    min_keyword_length = 5,
                },
                luasnip = {
                    name = "luasnip",
                    enabled = true,
                    module = "blink.cmp.sources.luasnip",
                    fallbacks = { "snippets" },
                    score_offset = 85,
                    max_items = 6,
                    opts = {
                        fuzzy = {
                            use_typo_resistance = false, -- reduce fuzziness
                            use_proximity = false,
                        },
                    },
                },
                -- dadbod = {
                --     name = "dadbod",
                --     module = "vim_dadbod_completion.blink",
                --     score_offset = 85,
                -- },
            },
        },
        snippets = {
            expand = function(snippet)
                require("luasnip").lsp_expand(snippet)
            end,
            active = function(filter)
                if filter and filter.direction then
                    return require("luasnip").jumpable(filter.direction)
                end
                return require("luasnip").in_snippet()
            end,
            jump = function(direction)
                require("luasnip").jump(direction)
            end,
        },
    },
}
