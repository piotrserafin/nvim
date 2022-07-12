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
    -- Packer
    use({ "wbthomason/packer.nvim" })

    -- Impatient
    use({ "lewis6991/impatient.nvim" })

    -- Theme --
    use({ "sainnhe/gruvbox-material" })

    -- Stausbar
    use({ "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

    -- Focus Mode
    use({ "Pocco81/TrueZen.nvim" })

    if require("ps.utils").is_darwin() then
        -- Vimwiki & Taskworrior & Calendar
        use({ "vimwiki/vimwiki", branch = "dev" })
        use({ "tools-life/taskwiki" })
        use({ "mattn/calendar-vim" })

        -- Markdown Preview
        use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })

        -- Google Keep Integration
        use({ "stevearc/gkeep.nvim", run = ":UpdateRemotePlugins" })
    end

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
    use({ "j-hui/fidget.nvim" })

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
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ "nvim-treesitter/nvim-treesitter-textobjects" })
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

    -- Notification Utility
    use({ "rcarriga/nvim-notify" })

    use({ "jbyuki/venn.nvim" })

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
