--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
        local cmd = vim.cmd
        local opt = vim.opt
        local g = vim.g

        cmd("colorscheme gruvbox-material")

        opt.termguicolors = true
        opt.background = "dark"
        g.gruvbox_material_background = "medium"
        g.gruvbox_material_palette = "material"
    end,
}
