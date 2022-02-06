--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local status_ok, lspkind = pcall(require, "lspkind")
if not status_ok then
  return
end

lspkind.init()
