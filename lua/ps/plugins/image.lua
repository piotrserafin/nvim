package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

return {
    "3rd/image.nvim",
    build = false,
    opts = {
        backend = "kitty",
        processor = "magick_cli",
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = true,
                filetypes = { "markdown" }, -- markdown extensions (ie. quarto) can go here
                resolve_image_path = function(document_path, image_path, fallback)
                    -- document_path is the path to the file that contains the image
                    -- image_path is the potentially relative path to the image. for
                    -- markdown it's `![](this text)`

                    -- you can call the fallback function to get the default behavior
                    return fallback(document_path, image_path)
                end,
            },
            neorg = {
                enabled = false,
                filetypes = { "norg" },
            },
            typst = {
                enabled = false,
                filetypes = { "typst" },
            },
        },
        editor_only_render_when_focused = true, -- auto show/hide images when the editor gains/looses focus
        tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
    },
}
