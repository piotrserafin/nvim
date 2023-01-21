--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

null_ls.setup({
    debug = false,
    sources = {
        null_ls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.prettier
    },
})

require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = true,
    automatic_setup = false,
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>nf", ":Format<cr>", opts)
