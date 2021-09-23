--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local saga = require('lspsaga')
local kind = require('lspkind')
local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')
local symbols_outline = require('symbols-outline')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)

  buf_set_keymap('n', '<Leader>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<Leader>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<Leader>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<Leader>D' , '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>q' , '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Lspsaga
  buf_set_keymap('n', '<Leader>gd', '<Cmd>Lspsaga preview_definition<CR>', opts)
  buf_set_keymap('n', '<Leader>gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
  buf_set_keymap('n', '<Leader>ca', '<Cmd>Lspsaga code_action<CR>', opts)
  buf_set_keymap('v', '<Leader>ca', '<Cmd>Lspsaga range_code_action<CR>', opts)
  buf_set_keymap('n', '<Leader>rn', '<Cmd>Lspsaga rename<CR>', opts)
  buf_set_keymap('n', '<Leader>e' , '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
  buf_set_keymap('n', '[d'        , '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  buf_set_keymap('n', ']d'        , '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  buf_set_keymap('n', '<C-k>'     , '<Cmd>Lspsaga signature_help<CR>', opts)
  buf_set_keymap('n', 'K'         , '<Cmd>Lspsaga hover_doc<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<Leader>f", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<Leader>f", "<Cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

local lua_settings = {
    Lua = {
        runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = vim.split(package.path, ';'),
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
            },
            maxPreload = 2000,
            preloadFileSize = 50000,
        },
        telemetry = {
            enable = false,
        }
    }
}

local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = on_attach,
    }
end

-- lsp-install
local function setup_servers()
    lspinstall.setup()

    -- get all installed servers
    local servers = lspinstall.installed_servers()
    -- ... and add manually installed servers
    -- table.insert(servers, "clangd")

    for _, server in pairs(servers) do
        local config = make_config()

        -- language specific config
        if server == "lua" then
          config.settings = lua_settings
        end
        if server == "clangd" then
          config.filetypes = {"c", "cpp"}; -- we don't want objective-c and objective-cpp!
          config.root_dir = function() return vim.loop.cwd() end
        end

        lspconfig[server].setup(config)
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
lspinstall.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

kind.init()
saga.init_lsp_saga()
symbols_outline.setup()

vim.cmd([[
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
]])
