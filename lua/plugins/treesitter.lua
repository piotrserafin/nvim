--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

-- Parser installation
local ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "html",
    "http",
    "javascript",
    "jq",
    "json",
    "latex",
    "lua",
    "xml",
    "graphql",
    "make",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "rust",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
    "sql",
    "go",
}

require("nvim-treesitter").setup({})

local installed = require("nvim-treesitter").get_installed()
local to_install = vim.tbl_filter(function(lang)
    return not vim.tbl_contains(installed, lang)
end, ensure_installed)

if #to_install > 0 then
    require("nvim-treesitter").install(to_install)
end

-- Textobjects
local ts_config = require("nvim-treesitter-textobjects.config")
ts_config.update({
    select = { lookahead = true },
    move = { set_jumps = true },
})

local ts_select = require("nvim-treesitter-textobjects.select")
local ts_swap = require("nvim-treesitter-textobjects.swap")
local ts_move = require("nvim-treesitter-textobjects.move")

local textobject_maps = {
    -- { mode, lhs, module_fn, query, desc }
    { { "x", "o" }, "af", ts_select.select_textobject, "@function.outer", "Select outer function" },
    { { "x", "o" }, "if", ts_select.select_textobject, "@function.inner", "Select inner function" },
    { { "x", "o" }, "ac", ts_select.select_textobject, "@class.outer", "Select outer class" },
    { { "x", "o" }, "ic", ts_select.select_textobject, "@class.inner", "Select inner class" },
    { "n", "<leader>a", ts_swap.swap_next, "@parameter.inner", "Swap parameter forward" },
    { "n", "<leader>A", ts_swap.swap_previous, "@parameter.inner", "Swap parameter backward" },
    { { "n", "x", "o" }, "]m", ts_move.goto_next_start, "@function.outer", "Next function start" },
    { { "n", "x", "o" }, "]]", ts_move.goto_next_start, "@class.outer", "Next class start" },
    { { "n", "x", "o" }, "]M", ts_move.goto_next_end, "@function.outer", "Next function end" },
    { { "n", "x", "o" }, "][", ts_move.goto_next_end, "@class.outer", "Next class end" },
    { { "n", "x", "o" }, "[m", ts_move.goto_previous_start, "@function.outer", "Prev function start" },
    { { "n", "x", "o" }, "[[", ts_move.goto_previous_start, "@class.outer", "Prev class start" },
    { { "n", "x", "o" }, "[M", ts_move.goto_previous_end, "@function.outer", "Prev function end" },
    { { "n", "x", "o" }, "[]", ts_move.goto_previous_end, "@class.outer", "Prev class end" },
}

for _, map in ipairs(textobject_maps) do
    local mode, lhs, fn, query, desc = map[1], map[2], map[3], map[4], map[5]
    vim.keymap.set(mode, lhs, function()
        fn(query)
    end, { desc = desc })
end
