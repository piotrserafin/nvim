--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

require("render-markdown").setup({
    render_modes = { "n", "c", "t" },
    completions = { blink = { enabled = false } },
    latex = { enabled = false },
    html = { enabled = false },
    yaml = { enabled = false },
})
