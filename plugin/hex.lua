local hex_buffers = {}

function HexToggle()
    local current_buf = vim.api.nvim_get_current_buf()

    if hex_buffers[current_buf] then
        vim.api.nvim_buf_delete(hex_buffers[current_buf], { force = true })
        hex_buffers[current_buf] = nil
        vim.api.nvim_echo({ { "Exited hex view", "InfoMsg" } }, false, {})
    else
        if vim.fn.executable("xxd") == 0 then
            vim.api.nvim_echo({ { "Error: 'xxd' command is not available.", "ErrorMsg" } }, false, {})
            return
        end

        vim.cmd("sview")
        local hex_buf = vim.api.nvim_create_buf(false, true) -- Unlisted and scratch buffer
        vim.api.nvim_win_set_buf(0, hex_buf)

        local lines = vim.api.nvim_buf_get_lines(current_buf, 0, -1, true)
        vim.api.nvim_buf_set_lines(hex_buf, 0, -1, true, lines)
        vim.cmd("%!xxd")

        -- Set buffer options
        vim.bo[hex_buf].filetype = "xxd"
        vim.bo[hex_buf].buftype = "nofile"
        vim.bo[hex_buf].swapfile = false
        vim.bo[hex_buf].bufhidden = "wipe"

        -- Track the relationship between buffers
        hex_buffers[current_buf] = hex_buf
        vim.api.nvim_echo({ { "Entered hex view", "InfoMsg" } }, false, {})
    end
end

vim.api.nvim_set_keymap("n", "<leader>hx", ":lua HexToggle()<CR>", { noremap = true, silent = true })
