--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--
-- External dependency check. Run with `:checkhealth config`.

local M = {}

-- { binary, purpose, required }
local deps = {
    -- Core tooling
    { "git", "vim.pack plugin management", true },
    { "rg", "grepprg + fzf-lua (ripgrep)", true },
    { "fd", "fzf-lua file finding (fd or fdfind)", false },
    { "fzf", "fzf-lua native fuzzy finder", false },
    { "make", "build LuaSnip jsregexp", false },
    { "cc", "treesitter parser compilation (gcc/clang)", true },

    -- LSP servers
    { "lua-language-server", "lua_ls", false },
    { "clangd", "clangd (C/C++)", false },
    { "gopls", "gopls (Go)", false },
    { "go", "gopls env detection", false },
    { "bash-language-server", "bashls", false },
    { "pyright-langserver", "pyright (Python)", false },
    { "marksman", "marksman (Markdown)", false },
    { "rust-analyzer", "rust_analyzer (Rust)", false },

    -- Formatters (conform.nvim)
    { "stylua", "format Lua", false },
    { "prettier", "format js/ts/json/yaml/markdown", false },
    { "shfmt", "format sh/bash", false },
    { "black", "format Python", false },
    { "clang-format", "format C/C++", false },

    -- Linters (nvim-lint)
    { "luacheck", "lint Lua", false },
    { "shellcheck", "lint sh/bash", false },

    -- Optional integrations
    { "tmux", "tmux-aware window navigation", false },
}

local function has(bin)
    return vim.fn.executable(bin) == 1
end

function M.check()
    local health = vim.health

    health.start("config: external dependencies")

    -- Neovim version
    if vim.fn.has("nvim-0.12") == 1 then
        health.ok("Neovim >= 0.12")
    else
        health.error("Neovim 0.12+ required (native LSP, vim.pack)")
    end

    for _, dep in ipairs(deps) do
        local bin, purpose, required = dep[1], dep[2], dep[3]
        -- fd is `fdfind` on Debian/Ubuntu
        local found = has(bin) or (bin == "fd" and has("fdfind"))
        if found then
            health.ok(("%s — %s"):format(bin, purpose))
        elseif required then
            health.error(("%s missing — %s"):format(bin, purpose))
        else
            health.warn(("%s missing — %s"):format(bin, purpose))
        end
    end

    health.start("config: clipboard")
    if vim.fn.has("clipboard") == 1 then
        local provider = "unknown"
        if vim.fn.has("mac") == 1 then
            provider = "pbcopy/pbpaste (macOS)"
        elseif vim.env.WAYLAND_DISPLAY and has("wl-copy") then
            provider = "wl-clipboard (Wayland)"
        elseif has("xclip") then
            provider = "xclip (X11)"
        elseif has("xsel") then
            provider = "xsel (X11)"
        end
        health.ok("system clipboard available: " .. provider)
    else
        health.warn(
            "no clipboard provider — install wl-clipboard (Wayland) or xclip/xsel (X11) for `unnamedplus` to work"
        )
    end
end

return M
