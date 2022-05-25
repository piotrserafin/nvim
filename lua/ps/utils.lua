--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

P = function(val)
    print(vim.inspect(val))
    return val
end

DN = function(val, msg)
    local time = os.date("%H:%M")
    local message = (msg or " ") .. " " .. time
    require("notify")(vim.inspect(val), "debug", { title = { "Debug Output", message } })
    return val
end
