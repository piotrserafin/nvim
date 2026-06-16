--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local function navigate(direction)
    local win = vim.api.nvim_get_current_win()
    vim.cmd.wincmd(direction)
    if vim.api.nvim_get_current_win() == win and vim.env.TMUX then
        local tmux_dir = ({ h = "L", j = "D", k = "U", l = "R" })[direction]
        vim.system({ "tmux", "select-pane", "-" .. tmux_dir })
    end
end

vim.keymap.set("n", "<C-h>", function()
    navigate("h")
end, { silent = true, desc = "Navigate left" })
vim.keymap.set("n", "<C-j>", function()
    navigate("j")
end, { silent = true, desc = "Navigate down" })
vim.keymap.set("n", "<C-k>", function()
    navigate("k")
end, { silent = true, desc = "Navigate up" })
vim.keymap.set("n", "<C-l>", function()
    navigate("l")
end, { silent = true, desc = "Navigate right" })

vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

vim.keymap.set("n", "<Leader>bn", "<Cmd>bnext<CR>", { silent = true, desc = "Buffer next" })
vim.keymap.set("n", "<Leader>bp", "<Cmd>bprevious<CR>", { silent = true, desc = "Buffer previous" })

vim.keymap.set("n", ";", ":", { desc = "Command mode" })
vim.keymap.set("v", ";", ":", { desc = "Command mode" })
vim.keymap.set("n", ",p", '"0p', { desc = "Paste last thing yanked" })
vim.keymap.set("n", ",P", '"0P', { desc = "Paste last thing yanked" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move line up" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Quickfix
vim.keymap.set("n", "<leader>qo", "<Cmd>copen<CR>", { desc = "Open quickfix" })
vim.keymap.set("n", "<leader>qc", "<Cmd>cclose<CR>", { desc = "Close quickfix" })
vim.keymap.set("n", "]q", "<Cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "[q", "<Cmd>cprev<CR>zz", { desc = "Prev quickfix item" })

-- Centered scroll/search
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search (centered)" })

-- Quickly source current file / execute Lua code
vim.keymap.set("n", "<leader>xx", "<Cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<leader>x", "<Cmd>:.lua<CR>", { desc = "Lua: execute current line" })
vim.keymap.set("v", "<leader>x", "<Cmd>:lua<CR>", { desc = "Lua: execute current selection" })

-- Yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})
