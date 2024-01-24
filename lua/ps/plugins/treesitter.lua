--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "JoosepAlviste/nvim-ts-context-commentstring"
    },
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "cmake",
            "cpp",
            "dockerfile",
            "html",
            "http",
            "javascript",
            "jq",
            "json",
            "latex",
            "lua",
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
            "sql"
        },
        ident = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
        },
        highlight = {
            enable = true,
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = false
        }
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
