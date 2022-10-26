--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
    return
end

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets"})

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        [require("luasnip.util.types").choiceNode] = {
            active = {
                virt_text = { { "<-", "GruvboxOrange" } },
            },
        },
    },
})

