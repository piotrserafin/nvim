--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

require("fzf-lua").setup({})

vim.keymap.set("n", "<Leader>ff", "<Cmd>FzfLua files<CR>", { desc = "Fzf: [F]ind [F]ile" })
vim.keymap.set("n", "<Leader>fg", "<Cmd>FzfLua live_grep<CR>", { desc = "Fzf: [F]ind [G]rep" })
vim.keymap.set("n", "<Leader>fb", "<Cmd>FzfLua buffers<CR>", { desc = "Fzf: [F]ind [B]uffer" })
vim.keymap.set("n", "<Leader>fs", "<Cmd>FzfLua grep<CR>", { desc = "Fzf: [F]ind [S]tring" })
vim.keymap.set("n", "<Leader>fd", "<Cmd>FzfLua diagnostics_workspace<CR>", { desc = "Fzf: [F]ind [D]iagnostics" })
vim.keymap.set("n", "<Leader>fr", "<Cmd>FzfLua lsp_references<CR>", { desc = "Fzf: [F]ind [R]eferences" })
vim.keymap.set("n", "<Leader>fh", "<Cmd>FzfLua help_tags<CR>", { desc = "Fzf: [F]ind [H]elp" })
vim.keymap.set("n", "<Leader>fp", "<Cmd>FzfLua builtin<CR>", { desc = "Fzf: [F]ind [P]ickers" })
vim.keymap.set(
    "n",
    "<Leader>fc",
    "<Cmd>FzfLua files prompt=Neovim> cwd=$HOME/.config/nvim<CR>",
    { desc = "Fzf: [F]ind Neovim [C]onfig" }
)
