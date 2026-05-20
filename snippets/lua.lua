--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local ls = require("luasnip")

local s = ls.s
local t = ls.text_node

return {
    s("psh", {
        t({
            "--  _____ _____",
            "-- |  _  |   __|  Piotr Serafin",
            "-- |   __|__   |  https://piotrserafin.dev",
            "-- |__|  |_____|  https://github.com/piotrserafin",
            "--",
        }),
    }),
}
