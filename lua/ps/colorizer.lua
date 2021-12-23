--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
    return
end

colorizer.setup()
