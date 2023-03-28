--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    ft = { "markdown", "vimwiki" },
    keys = {
        { "<Leader>mp", "<Cmd>MarkdownPreviewToggle<CR>", desc = "Toogle Markdown Preview" }
    },
    init = function()
        vim.g.mkdp_refresh_slow = 1
    end
}
