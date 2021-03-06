--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local status_ok, rest = pcall(require, "rest-nvim")
if not status_ok then
    return
end

rest.setup({
    result_split_horizontal = false,
    skip_ssl_verification = false,
    jump_to_request = true,
})

vim.api.nvim_set_keymap("n", "<Leader>rr", "<Plug>RestNvim<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "<Leader>rp", "<Plug>RestNvimPreview<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "<Leader>rl", "<Plug>RestNvimLast<CR>", { noremap = false })
