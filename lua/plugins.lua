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
        use { 'morhetz/gruvbox' }

        -- Stausbar
        use { 'itchyny/lightline.vim' }

        -- Focus Mode
        use { 'junegunn/goyo.vim' }
        use { 'junegunn/limelight.vim' }

        -- UltiSnips
        use { 'SirVer/ultisnips' }

        -- Vimwiki & Taskworrior & Calendar
        use { 'vimwiki/vimwiki',  branch = 'dev' }
        use { 'tools-life/taskwiki' }
        use { 'mattn/calendar-vim' }

        -- Markdown Preview
        use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
        use { 'npxbr/glow.nvim', run = ':GlowInstall' }

        -- Tmux syntax highlight
        use { 'tmux-plugins/vim-tmux' }
        use { 'christoomey/vim-tmux-navigator' }

        -- TPope essentials
        use { 'tpope/vim-commentary' }
        use { 'tpope/vim-fugitive' }
        use { 'tpope/vim-surround' }

        -- LSP
        use { 'neovim/nvim-lspconfig' }
        use { 'hrsh7th/nvim-compe' }
        use { 'simrat39/symbols-outline.nvim' }
        use { 'onsails/lspkind-nvim' }

        -- Telescope
        use { 'nvim-lua/popup.nvim' }
        use { 'nvim-lua/plenary.nvim' }
        use { 'nvim-telescope/telescope.nvim' }
        use { 'nvim-telescope/telescope-fzy-native.nvim' }

        -- Treesitter
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use { 'nvim-treesitter/playground' }

        -- Debugging
        -- use { 'puremourning/vimspector' }
        -- use { 'nvim-telescope/telescope-vimspector.nvim' }

        -- Colorizer
        use { 'norcalli/nvim-colorizer.lua' }

        -- Maximizer
        use { 'szw/vim-maximizer' }

        -- Devicons
        use { 'kyazdani42/nvim-web-devicons' }

        -- Nvim-tree
        use { 'kyazdani42/nvim-tree.lua' }

        -- Floaterm
        use { 'voldikss/vim-floaterm' }

        -- Diagrams
        use { 'gyim/vim-boxdraw' }

        -- Games
        use { 'ThePrimeagen/vim-be-good' }

    end)
end

local function init()
    check_packer()
    init_packer()
end

return {
    init = init
}
