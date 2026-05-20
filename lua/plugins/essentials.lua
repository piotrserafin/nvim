--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    -- Essentials
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        opts = {},
        init = function()
            vim.notify = function(...)
                -- Lazy-load on first call, then delegate
                vim.notify = require("notify")
                return vim.notify(...)
            end
        end,
    },
}
