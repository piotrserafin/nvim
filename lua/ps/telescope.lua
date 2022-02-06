--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        prompt_prefix = " >",

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
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
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("dap")
require("telescope").load_extension("gkeep")

local function search_dotfiles()
    require("telescope.builtin").find_files({
        prompt_title = "< Neovim >",
        cwd = "$HOME/.config/nvim/",
    })
end

local function search_vimwiki()
    require("telescope.builtin").find_files({
        prompt_title = "< VimWiki >",
        cwd = "$HOME/Documents/vimwiki/",
    })
end

-- telescope
vim.api.nvim_set_keymap(
    "n",
    "<C-p>",
    ':lua require("telescope.builtin").git_files()<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>ff",
    ':lua require("telescope.builtin").find_files()<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>fg",
    ':lua require("telescope.builtin").live_grep()<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>fb",
    ':lua require("telescope.builtin").buffers()<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>fh",
    ':lua require("telescope.builtin").help_tags()<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>ps",
    ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<CR>',
    { noremap = true, silent = true }
)

-- user
vim.api.nvim_set_keymap(
    "n",
    "<Leader>fd",
    ':lua require("ps.telescope").search_dotfiles()<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>fv",
    ':lua require("ps.telescope").search_vimwiki()<CR>',
    { noremap = true, silent = true }
)

-- telescope-dap
vim.api.nvim_set_keymap(
    "n",
    "<Leader>df",
    ':lua require("telescope").extensions.dap.frames()<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>dc",
    ':lua require("telescope").extensions.dap.configurations()<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>db",
    ':lua require("telescope").extensions.dap.list_breakpoints()<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>dv",
    ':lua require("telescope").extensions.dap.variables()<CR>',
    { noremap = true, silent = true }
)

return {
    search_dotfiles = search_dotfiles,
    search_vimwiki = search_vimwiki,
}
