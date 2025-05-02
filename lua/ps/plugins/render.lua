return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
        render_modes = { "n", "c", "t" },
        completions = {
            blink = { enabled = true },
        },
    },
}
