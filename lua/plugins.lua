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
        use { "Pocco81/TrueZen.nvim" }

        -- UltiSnips
        use { 'SirVer/ultisnips' }

        -- Vimwiki & Taskworrior & Calendar
        use { 'vimwiki/vimwiki',  branch = 'dev' }
        use { 'tools-life/taskwiki' }
        use { 'mattn/calendar-vim' }

        -- Markdown Preview
        use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }

        -- Tmux syntax highlight
        use { 'tmux-plugins/vim-tmux' }
        use { 'christoomey/vim-tmux-navigator' }

        -- Comments
        use { 'b3nj5m1n/kommentary' }

        -- TPope essentials
        use { 'tpope/vim-surround' }

        -- LSP
        use { 'neovim/nvim-lspconfig' }
        use { 'kabouzeid/nvim-lspinstall' }
        use { 'glepnir/lspsaga.nvim' }
        use { 'onsails/lspkind-nvim' }
        use { 'simrat39/symbols-outline.nvim' }

        -- Completetion (obsolete, switch to nvim-cmp)
        use { 'hrsh7th/nvim-compe' }

        -- Telescope
        use { 'nvim-lua/popup.nvim' }
        use { 'nvim-lua/plenary.nvim' }
        use { 'nvim-telescope/telescope.nvim' }
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        use { 'nvim-telescope/telescope-dap.nvim' }

        -- Treesitter
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use { 'nvim-treesitter/playground' }

        -- Debugging (nvim-dap)
        use { 'mfussenegger/nvim-dap' }
        use { 'theHamsta/nvim-dap-virtual-text' }

        -- Colorizer
        use { 'norcalli/nvim-colorizer.lua' }

        -- Devicons
        use { 'kyazdani42/nvim-web-devicons' }

        -- Nvim-tree
        use { 'kyazdani42/nvim-tree.lua' }

        -- Term
        use { "akinsho/toggleterm.nvim" }

        -- REST Client
        use { 'NTBBloodbath/rest.nvim' }

        -- Firenvim
        use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

        -- Startup
        use { 'henriquehbr/nvim-startup.lua' }

        -- JSON
        use { 'gennaro-tedesco/nvim-jqx' }

    end)
end

local function init()
    check_packer()
    init_packer()
end

init()
