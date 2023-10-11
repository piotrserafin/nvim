--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    run = "make install_jsregexp",
    init = function()
        require("luasnip").config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",
            enable_autosnippets = false,
            ext_opts = {
                [require("luasnip.util.types").choiceNode] = {
                    active = {
                        virt_text = { { "<-", "GruvboxOrange" } },
                    },
                },
            },
        })

        require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
    end,
}
