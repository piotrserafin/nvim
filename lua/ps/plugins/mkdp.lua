--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    ft = { "markdown", "vimwiki", "puml" },
    keys = {
        { "<Leader>mp", "<Cmd>MarkdownPreviewToggle<CR>", desc = "Toogle Markdown Preview" },
    },
    init = function()
        vim.g.mkdp_refresh_slow = 1
        vim.g.mkdp_preview_options = {
            uml = {
                server = os.getenv("PLANTUML_URL"),
            },
        }
    end,
}
