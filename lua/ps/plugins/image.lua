package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

return {
    "3rd/image.nvim",
    opts = {
        backend = "kitty",
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = false,
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
        },
        kitty_method = "normal",
    },
}
