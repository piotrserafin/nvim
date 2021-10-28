--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local function check_packer()
    local cmd = vim.api.nvim_command
    local fn = vim.fn

    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
        cmd 'packadd packer.nvim'
    end
end

local function init_packer()
    require('packer').startup(function(use)

        -- Packer --
        use { 'wbthomason/packer.nvim' }

        -- Theme --
        use { 'sainnhe/gruvbox-material' }

        -- Stausbar
        use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

        -- Focus Mode
        use { 'Pocco81/TrueZen.nvim' }

        -- Vimwiki & Taskworrior & Calendar
        use { 'vimwiki/vimwiki',  branch = 'dev' }
        use { 'tools-life/taskwiki' }
        use { 'mattn/calendar-vim' }

        -- Markdown Preview
        use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }

        -- Comments
        use { 'b3nj5m1n/kommentary' }

        -- TPope essentials
        use { 'tpope/vim-surround' }

        -- LSP
        use { 'neovim/nvim-lspconfig' }
        use { 'williamboman/nvim-lsp-installer' }
        use { 'glepnir/lspsaga.nvim' }
        use { 'onsails/lspkind-nvim' }
        use { 'simrat39/symbols-outline.nvim' }

        -- Completetion
        use { 'saadparwaiz1/cmp_luasnip' }
        use { 'hrsh7th/cmp-nvim-lsp' }
        use { 'hrsh7th/cmp-nvim-lua' }
        use { 'hrsh7th/cmp-buffer' }
        use { 'hrsh7th/cmp-path' }
        use { 'hrsh7th/nvim-cmp' }

        -- Snipets
        use { 'L3MON4D3/LuaSnip' }

        -- Telescope
        use { 'nvim-lua/popup.nvim' }
        use { 'nvim-lua/plenary.nvim' }
        use { 'nvim-telescope/telescope.nvim' }
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        use { 'nvim-telescope/telescope-dap.nvim' }

        -- Treesitter
        use { 'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate' }
        use { 'nvim-treesitter/nvim-treesitter-textobjects', branch = '0.5-compat' }
        use { 'nvim-treesitter/playground' }

        -- Debugging (nvim-dap)
        use { 'mfussenegger/nvim-dap' }
        use { 'theHamsta/nvim-dap-virtual-text' }

        -- Colorizer
        use { 'norcalli/nvim-colorizer.lua' }

        -- Devicons
        use { 'kyazdani42/nvim-web-devicons' }

        -- Nvim-tree
        use { 'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'} }

        -- Term
        use { "akinsho/toggleterm.nvim" }

        -- REST Client
        use { 'NTBBloodbath/rest.nvim', requires = { "nvim-lua/plenary.nvim" } }

        -- Startup
        use { 'henriquehbr/nvim-startup.lua' }

        -- JSON
        use { 'gennaro-tedesco/nvim-jqx' }

        -- Lua Reference Docs
        use { 'wsdjeg/luarefvim' }

        -- Google Keep Integration
        use {'stevearc/gkeep.nvim', run = ':UpdateRemotePlugins'}

    end)
end

local function init()
    check_packer()
    init_packer()
end

init()
