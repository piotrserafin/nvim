--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    init = function()
        require("luasnip").config.set_config({
            updateevents = "TextChanged,TextChangedI",
        })

        require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim-restart/snippets/" })
    end,
}
