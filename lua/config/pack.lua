--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

-- Helper for GitHub sources
local gh = function(x)
    return "https://github.com/" .. x
end

-----------------------------------------------------------------------
-- Build hooks (PackChanged autocmd)
-----------------------------------------------------------------------
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if kind ~= "install" and kind ~= "update" then
            return
        end

        -- LuaSnip: build jsregexp
        if name == "LuaSnip" then
            vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path }):wait()
        end

        -- Treesitter: update parsers
        if name == "nvim-treesitter" then
            if not ev.data.active then
                vim.cmd.packadd("nvim-treesitter")
            end
            vim.cmd("TSUpdate")
        end
    end,
})

-----------------------------------------------------------------------
-- Plugin specs
-----------------------------------------------------------------------
vim.pack.add({
    -- Colorscheme
    { src = gh("catppuccin/nvim"), name = "catppuccin" },

    -- UI
    gh("j-hui/fidget.nvim"),
    gh("nvim-lualine/lualine.nvim"),
    gh("nvim-tree/nvim-web-devicons"),
    gh("nvzone/showkeys"),

    -- Navigation / Files
    gh("stevearc/oil.nvim"),
    gh("ibhagwan/fzf-lua"),

    -- Treesitter
    { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
    { src = gh("nvim-treesitter/nvim-treesitter-textobjects"), version = "main" },

    -- LSP / Dev tools
    gh("folke/lazydev.nvim"),
    gh("stevearc/conform.nvim"),
    gh("mfussenegger/nvim-lint"),

    -- Snippets
    { src = gh("L3MON4D3/LuaSnip"), version = vim.version.range("2") },

    -- Misc
    gh("mistweaverco/kulala.nvim"),
    gh("MeanderingProgrammer/render-markdown.nvim"),
    gh("m4xshen/hardtime.nvim"),
    gh("MunifTanjim/nui.nvim"),

    -- Notes
    { src = gh("obsidian-nvim/obsidian.nvim"), version = vim.version.range("3") },
})
