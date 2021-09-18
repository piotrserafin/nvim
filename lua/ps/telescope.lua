--   _____ _____
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

vim.cmd([[
nnoremap <C-p>      :lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<cr>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fd :lua require('ps.telescope').search_dotfiles()<cr>
nnoremap <leader>fv :lua require('ps.telescope').search_vimwiki()<cr>

" telescope-dap
nnoremap <leader>df :lua require('telescope').extensions.dap.frames()<cr>
nnoremap <leader>dc :lua require('telescope').extensions.dap.configurations()<cr>
nnoremap <leader>db :lua require('telescope').extensions.dap.list_breakpoints()<cr>
nnoremap <leader>dv :lua require('telescope').extensions.dap.variables()<cr>
]])

return {
    search_dotfiles = search_dotfiles,
    search_vimwiki = search_vimwiki
}
