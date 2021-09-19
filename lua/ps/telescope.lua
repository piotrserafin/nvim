
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local actions = require('telescope.actions')
require('telescope').setup({
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
})

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('dap')

local function search_dotfiles()
    require('telescope.builtin').find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/.config/nvim/",
    })
end

local function search_vimwiki()
    require('telescope.builtin').find_files({
        prompt_title = "< VimWiki >",
        cwd = "$HOME/Documents/vimwiki/",
    })
end

local map = require('utils').map

-- telescope
map('n', '<C-p>',       ':lua require("telescope.builtin").git_files()<CR>')
map('n', '<Leader>ps',  ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<CR>')
map('n', '<Leader>ff',  ':lua require("telescope.builtin").find_files()<CR>')
map('n', '<Leader>fg',  ':lua require("telescope.builtin").live_grep()<CR>')
map('n', '<Leader>fb',  ':lua require("telescope.builtin").buffers()<CR>')
map('n', '<Leader>fh',  ':lua require("telescope.builtin").help_tags()<CR>')
map('n', '<Leader>fd',  ':lua require("ps.telescope").search_dotfiles()<CR>')
map('n', '<Leader>fv',  ':lua require("ps.telescope").search_vimwiki()<CR>')

-- telescope-dap
map('n', '<Leader>df', ':lua require("telescope").extensions.dap.frames()<CR>')
map('n', '<Leader>dc', ':lua require("telescope").extensions.dap.configurations()<CR>')
map('n', '<Leader>db', ':lua require("telescope").extensions.dap.list_breakpoints()<CR>')
map('n', '<Leader>dv', ':lua require("telescope").extensions.dap.variables()<CR>')

return {
    search_dotfiles = search_dotfiles,
    search_vimwiki = search_vimwiki
}
