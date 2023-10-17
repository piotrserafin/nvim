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
local f = ls.function_node

local date = function()
    return { os.date("%Y-%m-%d") }
end

ls.add_snippets(nil, {
    all = {
        s({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD",
        }, {
            f(date, {}),
        }),
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
    sh = {
        s("!#", {
            t({ "#!/usr/bin/env bash" }),
        }),
    },
})
