--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck" },
    sh = { "shellcheck" },
    bash = { "shellcheck" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("lint", { clear = true }),
    callback = function()
        lint.try_lint()
    end,
})

vim.keymap.set("n", "<Leader>cl", function()
    lint.try_lint()
end, { desc = "Lint: [C]ode [L]int" })
