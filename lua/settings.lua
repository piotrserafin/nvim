--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

local indent = 4

--------------------------
--  Basic Configuration  -
--------------------------

-- Basic
cmd("syntax enable") -- enable syntax highlight

opt.showmode = false -- no message on status line to show current mode
opt.showcmd = true -- show (partial) command in status line

-- Indentation
cmd("filetype indent on") -- switch on file type detection, with automatic indenting and settings
opt.autoindent = true -- take indent for new line from previous line
opt.expandtab = true -- use spaces when <Tab> is inserted
opt.tabstop = indent -- number of spaces that <Tab> in file uses
opt.shiftwidth = indent -- number of spaces to use for (auto)indent step
opt.softtabstop = indent -- number of spaces that <Tab> uses while editing

-- Appearance
opt.number = true -- print the line number in front of each line
opt.relativenumber = true -- show relative line number in front of each line
opt.textwidth = 120 -- maximum width of text that is being inserted
opt.wrap = false -- long lines nowrap
opt.ruler = true -- show the line and column number of the cursor position
opt.colorcolumn = "80,120" -- comma separated list of screen columns
opt.cursorline = true -- Highlight the screen line of the cursor with CursorLine
opt.foldenable = false -- when off, all folds are open
opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor
opt.signcolumn = "yes"
opt.guicursor = ""

-- Theme
opt.termguicolors = true
opt.background = "dark"
g.gruvbox_material_background = "medium"
g.gruvbox_material_palette = "material"

cmd("colorscheme gruvbox-material")

-- Behaviour
opt.belloff = "all"
opt.hidden = true
opt.grepprg = "rg --vimgrep --smart-case --no-heading" -- search with rg
opt.grepformat = "%f:%l:%c:%m" -- filename:line number:column number:error message
opt.mouse = "a"
opt.history = 1000

-- Search
opt.path:append(".,**")
opt.wildmode = "longest,list,full"
opt.wildmenu = true
opt.showmatch = true
opt.hlsearch = false
opt.incsearch = true -- show dynamic matching pattern
opt.smartcase = true -- when use uppercase then it will match on case
opt.ignorecase = true -- ignore case when searching ... unless smartcase

-- Edit
opt.swapfile = false
opt.undofile = true

opt.list = true
opt.listchars = {
    tab = "??? ",
    eol = "???",
    nbsp = "???",
    extends = "???",
    precedes = "???",
    trail = "??",
}

opt.clipboard:append("unnamedplus")
opt.shortmess:append("c")

opt.completeopt = "menu,menuone,noselect"

-- Disable builtin vim plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- Disable Python2 support
vim.g.loaded_python_provider = 0

-- Disable perl provider
vim.g.loaded_perl_provider = 0
