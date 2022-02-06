--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local status_ok, symbols_outline = pcall(require, "symbols-outline")
if not status_ok then
    return
end

symbols_outline.setup()
