--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "NTBBloodbath/rest.nvim",
    lazy = true,
    ft = "http",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<Leader>rr", "<Plug>RestNvim<CR>", desc = "[R]estNvim [R]equest" },
        { "<Leader>rp", "<Plug>RestNvimPreview<CR>", desc = "[R]estNvim [P]review" },
        { "<Leader>rl", "<Plug>RestNvimLast<CR>", desc = "[R]estNvim [L]ast" },
    },
    config = function()
        require("rest-nvim").setup({
            result_split_horizontal = false,
            result_split_in_place = true,

            skip_ssl_verification = false,
            jump_to_request = true,
            result = {
                show_url = true,
                show_curl_command = true,
                show_http_info = true,
                show_headers = true,
            },
        })
    end,
}
