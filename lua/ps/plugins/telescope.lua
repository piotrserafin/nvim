--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

function _G.Search_nvim_config()
    require("telescope.builtin").find_files({
        prompt_title = "< Neovim >",
        cwd = "$HOME/.config/nvim/",
    })
end

function _G.Search_vimwiki()
    require("telescope.builtin").find_files({
        prompt_title = "< VimWiki >",
        cwd = "$HOME/org/vimwiki/",
    })
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        }
    },
    cmd = "Telescope",
    keys = {
        { '<C-p>',      '<Cmd>Telescope git_files<CR>', desc = 'Find file' },
        { '<Leader>ff', '<Cmd>Telescope find_files<CR>', desc = 'Find file' },
        { '<Leader>fg', '<Cmd>Telescope live_grep<CR>', desc = 'Find line' },
        { '<Leader>fb', '<Cmd>Telescope buffers<CR>', desc = 'Find buffer' },
        { '<Leader>fs', '<Cmd>Telescope grep_string<CR>', desc = 'Find string' },
        { '<Leader>fP', '<Cmd>Telescope builtin<CR>', desc = 'List all pickers' },
        { "<Leader>fd", "<Cmd>lua Search_nvim_config()<CR>", desc = "Search in nvim config" },
        { "<Leader>fv", "<Cmd>lua Search_vimwiki()<CR>", desc = "Search in vimwiki" }
    },
    opts = {
        defaults = {
            prompt_prefix = " >",

            mappings = {
                i = {
                    ["<C-x>"] = false,
                },
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
            },
        },
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        pcall(require("telescope").load_extension("fzf"))
        pcall(require("telescope").load_extension("gkeep"))
    end
}
