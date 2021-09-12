--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

require("rest-nvim").setup({
    result_split_horizontal = false,
    skip_ssl_verification = false
})

vim.cmd([[
nmap <leader>rr <Plug>RestNvim<cr>
nmap <leader>rp <Plug>RestNvimPreview<cr>
nmap <leader>rl <Plug>RestNvimLast<cr>
]])
