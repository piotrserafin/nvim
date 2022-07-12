--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local M = {}

function M.debug_print(val)
    print(vim.inspect(val))
    return val
end

function M.debug_notify(val, msg)
    local time = os.date("%H:%M")
    local message = (msg or " ") .. " " .. time
    require("notify")(vim.inspect(val), "debug", { title = { "Debug Output", message } })
    return val
end

function M.is_darwin()
  return vim.loop.os_uname().sysname == 'Darwin'
end

return M
