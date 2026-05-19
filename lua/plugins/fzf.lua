--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    keys = {
        { "<Leader>ff", "<Cmd>FzfLua files<CR>", desc = "Fzf: [F]ind [F]ile" },
        { "<Leader>fg", "<Cmd>FzfLua live_grep<CR>", desc = "Fzf: [F]ind [G]rep" },
        { "<Leader>fb", "<Cmd>FzfLua buffers<CR>", desc = "Fzf: [F]ind [B]uffer" },
        { "<Leader>fs", "<Cmd>FzfLua grep<CR>", desc = "Fzf: [F]ind [S]tring" },
        { "<Leader>fp", "<Cmd>FzfLua builtin<CR>", desc = "Fzf: [F]ind [P]ickers" },
        {
            "<Leader>fc",
            "<Cmd>FzfLua files prompt=Neovim> cwd=$HOME/.config/nvim<CR>",
            desc = "Fzf: [F]ind Neovim [C]onfig",
        },
    },
    opts = {},
}
