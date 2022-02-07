--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })

    print("Installing packer close and reopne Neovim...")
    vim.cmd([[ packadd packer.nvim ]])
end

-- Autcommand for calling PackerSync after every change in this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Floating window instead of split
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Plugins list
return packer.startup(function(use)
    -- Packer --
    use({ "wbthomason/packer.nvim" })

    -- Theme --
    use({ "sainnhe/gruvbox-material" })

    -- Stausbar
    use({ "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

    -- Focus Mode
    use({ "Pocco81/TrueZen.nvim" })

    -- Vimwiki & Taskworrior & Calendar
    use({ "vimwiki/vimwiki", branch = "dev" })
    use({ "tools-life/taskwiki" })
    use({ "mattn/calendar-vim" })

    -- Markdown Preview
    use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })

    -- Comments
    use({ "numToStr/Comment.nvim" })

    -- TPope essentials
    use({ "tpope/vim-surround" })

    -- LSP
    use({ "neovim/nvim-lspconfig" })
    use({ "williamboman/nvim-lsp-installer" })
    use({ "onsails/lspkind-nvim" })
    use({ "simrat39/symbols-outline.nvim" })
    use({ "jose-elias-alvarez/null-ls.nvim" })

    -- Completetion
    use({ "saadparwaiz1/cmp_luasnip" })
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-nvim-lua" })
    use({ "hrsh7th/cmp-buffer" })
    use({ "hrsh7th/cmp-path" })
    use({ "hrsh7th/nvim-cmp" })

    -- Snipets
    use({ "L3MON4D3/LuaSnip" })

    -- Telescope
    use({ "nvim-lua/popup.nvim" })
    use({ "nvim-lua/plenary.nvim" })
    use({ "nvim-telescope/telescope.nvim" })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "nvim-telescope/telescope-dap.nvim" })

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", branch = "0.5-compat", run = ":TSUpdate" })
    use({ "nvim-treesitter/nvim-treesitter-textobjects", branch = "0.5-compat" })
    use({ "nvim-treesitter/playground" })

    -- Debugging (nvim-dap)
    use({ "mfussenegger/nvim-dap" })
    use({ "theHamsta/nvim-dap-virtual-text" })

    -- Git Integration
    use({ "lewis6991/gitsigns.nvim" })

    -- Colorizer
    use({ "norcalli/nvim-colorizer.lua" })

    -- Devicons
    use({ "kyazdani42/nvim-web-devicons" })

    -- Nvim-tree
    use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })

    -- Term
    use({ "akinsho/toggleterm.nvim" })

    -- REST Client
    use({ "NTBBloodbath/rest.nvim", requires = { "nvim-lua/plenary.nvim" } })

    -- Startup
    use({ "henriquehbr/nvim-startup.lua" })

    -- Lua Reference Docs
    use({ "wsdjeg/luarefvim" })

    -- Google Keep Integration
    use({ "stevearc/gkeep.nvim", run = ":UpdateRemotePlugins" })

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
