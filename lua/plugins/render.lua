--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = "markdown",
    lazy = true,
    opts = {
        render_modes = { "n", "c", "t" },
        completions = {
            blink = { enabled = true },
        },
        latex = {
            enabled = false,
        },
    },
}
