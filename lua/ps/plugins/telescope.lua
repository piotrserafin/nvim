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
                return vim.fn.executable("make") == 1
            end,
        },
    },
    cmd = "Telescope",
    keys = {
        { "<C-p>", "<Cmd>Telescope git_files<CR>", desc = "Telescope: Find git file" },
        { "<Leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Telescope: [F]ind [F]ile" },
        { "<Leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "Telescope: [F]ind [G]rep" },
        { "<Leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Telescope: [F]ind [B]uffer" },
        { "<Leader>fs", "<Cmd>Telescope grep_string<CR>", desc = "Telescope: [F]ind [S]tring" },
        { "<Leader>fp", "<Cmd>Telescope builtin<CR>", desc = "Telescope: [F]ind [P]ickers" },
        { "<Leader>fc", "<Cmd>lua Search_nvim_config()<CR>", desc = "Telescope: [F]ind Neovim [C]onfig" },
        { "<Leader>fv", "<Cmd>lua Search_vimwiki()<CR>", desc = "Telescope: [F]ind [V]imwiki" },
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
        -- pickers = {
        --     find_files = {
        --         find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        --     },
        -- },
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
    end,
}
