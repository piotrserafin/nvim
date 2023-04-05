--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "NTBBloodbath/rest.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<Leader>rr", "<Plug>RestNvim<CR>", desc = "RestNvim Request" },
        { "<Leader>rp", "<Plug>RestNvimPreview<CR>", desc = "RestNvim Preview" },
        { "<Leader>rl", "<Plug>RestNvimLast<CR>", desc = "RestNvim Last" },
    },
    opts = {
        result_split_horizontal = false,
        skip_ssl_verification = false,
        jump_to_request = true,
    },
}
