--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

-- Icons (natively supported by oil.nvim and fzf-lua)
require("mini.icons").setup()

require("mini.statusline").setup({
    use_icons = vim.g.have_nerd_font,
})

local ai = require("mini.ai")
ai.setup({
    n_lines = 500,
    custom_textobjects = {
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
        a = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
    },
})

require("mini.surround").setup()
