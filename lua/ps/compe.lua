--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

require('compe').setup({
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    -- Built-in
    buffer = true;
    path = true;
    spell = true;
    tags = true;
    emoji = true;

    -- Neovim
    nvim_lsp = true;
    nvim_lua = true;

    -- External plugin
    ultisnips = true;
  };
})

local map = require('utils').map
local opts = { noremap = true, silent = true, expr = true }

map('i', '<C-Space>', "compe#complete()", opts)
map('i', '<CR>'     , "compe#confirm('<CR>')", opts)
map('i', '<C-e>'    , "compe#close('<C-e>')", opts)
map('i', '<C-f>'    , "compe#scroll({ 'delta': +4 })", opts)
map('i', '<C-d>'    , "compe#scroll({ 'delta': -4 })", opts)
