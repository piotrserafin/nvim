--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "hrsh7th/nvim-cmp",
    version = false,
    priority = 100,
    event = "InsertEnter",
    dependencies = {
        "onsails/lspkind-nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
        local cmp = require("cmp")
        local kind = require("lspkind")

        return {
            completion = {
                completeopt = "menu, menuone, noselect",
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            view = {
                entries = "custom",
            },
            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-y>"] = cmp.mapping(cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                })),
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer", keyword_length = 5, max_item_count = 10 },
            }),
            formatting = {
                format = kind.cmp_format({
                    -- mode = "symbol_text",
                    menu = {
                        nvim_lsp = "[lsp]",
                        path = "[path]",
                        buffer = "[buff]",
                    },
                }),
            },
            experimental = {
                ghost_text = false,
            },
        }
    end,
    init = function()
        -- Setup up vim-dadbod
        require("cmp").setup.filetype({ "sql" }, {
            sources = {
                { name = "vim-dadbod-completion" },
                { name = "buffer" },
            },
        })

        local ls = require("luasnip")
        ls.config.set_config({
            history = false,
            updateevents = "TextChanged,TextChangedI",
        })

        for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("/home/piotrserafin/.config/nvim/snippets/*.lua", true)) do
            loadfile(ft_path)()
        end

        vim.keymap.set({ "i", "s" }, "<c-k>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<c-j>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })
    end,
}
