--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
    return
end

local s = ls.s
local t = ls.text_node

ls.add_snippets(nil, {
    all = {
        s("psh", {
            t({
                "   _____ _____",
                "  |  _  |   __|  Piotr Serafin",
                "  |   __|__   |  https://piotrserafin.dev",
                "  |__|  |_____|  https://github.com/piotrserafin",
                "",
            })
        })
    },
    lua = {
        s("psh", {
            t({
                "--   _____ _____",
                "--  |  _  |   __|  Piotr Serafin",
                "--  |   __|__   |  https://piotrserafin.dev",
                "--  |__|  |_____|  https://github.com/piotrserafin",
                "--",
            })
        })
    },
    sh = {
        s("!#", {
            t({ "#!/usr/bin/env bash" })
        })
    }
})
