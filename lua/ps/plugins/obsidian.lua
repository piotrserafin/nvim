--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = {
        "BufReadPre " .. vim.fn.expand("~") .. "/org/vaults/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. "/org/vaults/**.md",
    },
    cmd = {
        "ObsidianOpen",
        "ObsidianNew",
        "ObsidianQuickSwitch",
        "ObsidianFollowLink",
        "ObsidianBacklinks",
        "ObsidianToday",
        "ObsidianYesterday",
        "OrsidianTomorrow",
        "ObsidianTemplate",
        "ObsidianSearch",
        "ObsidianLink",
        "ObsidianLinkNew",
        "ObsidianWorkspace",
    },
    keys = {
        { "<Leader>oq", "<Cmd>ObsidianQuickSwitch<CR>", { noremap = true, silent = true, desc = "Open note" } },
    },
    opts = {
        workspaces = {
            {
                name = "work",
                path = os.getenv("OBSIDIAN_WORK"),
            },
            {
                name = "personal",
                path = os.getenv("OBSIDIAN_PERSONAL"),
            },
        },

        notes_subdir = "00_Inbox",

        daily_notes = {
            folder = "00_Inbox/daily",
            date_format = "%Y-%m-%d",
            default_tags = { "daily" },
            template = "daily.md",
        },

        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },

        new_notes_location = "notes_subdir",

        -- Example:
        -- If title given: test note -> test-note
        -- If title nil:   nil -> 163123123
        note_id_func = function(title)
            if title ~= nil then
                title = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                title = tostring(os.time())
            end
            return title
        end,

        preferred_link_style = "markdown",

        image_name_func = function()
            -- Prefix image names with timestamp.
            return string.format("%s-", os.time())
        end,

        note_frontmatter_func = function(note)
            if note.title then
                note:add_alias(note.title)
            end

            local out = { id = note.id, aliases = note.aliases, tags = note.tags }

            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end

            return out
        end,

        templates = {
            folder = "99_Templates",
            date_format = "%Y-%m-%d",
            time_format = "%H-%M",
        },

        follow_url_func = function(url)
            vim.fn.jobstart({ "xdg-open", url })
        end,

        open_app_foreground = true,

        picker = {
            name = "telescope.nvim",
            mappings = {
                new = "<C-x>",
                insert_link = "<C-l>",
            },
        },

        callback = {
            post_set_workspace = function(client, workspace)
                client.log.info("Changing directory to %s", workspace.path)
                vim.cmd.cd(tostring(workspace.path))
            end,
        },

        attachments = {
            img_folder = "97_Assets",
        },

        ui = { enable = false },
    },
}
