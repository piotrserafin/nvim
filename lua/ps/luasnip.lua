--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
    return
end

local types = require("luasnip.util.types")

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<-", "Error" } },
            },
        },
    },
})

local s = ls.s
local t = ls.text_node

ls.snippets = {
    all = {
        s("psh", {
            t({
                "   _____ _____",
                "  |  _  |   __|  Piotr Serafin",
                "  |   __|__   |  https://piotrserafin.dev",
                "  |__|  |_____|  https://github.com/piotrserafin",
                "",
            }),
        }),
    },

    lua = {
        s("psh", {
            t({
                "--   _____ _____",
                "--  |  _  |   __|  Piotr Serafin",
                "--  |   __|__   |  https://piotrserafin.dev",
                "--  |__|  |_____|  https://github.com/piotrserafin",
                "--",
            }),
        }),
    },
}
