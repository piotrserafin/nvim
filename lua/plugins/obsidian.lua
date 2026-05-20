--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
        "BufReadPre " .. vim.fn.expand("~") .. "/org/vaults/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. "/org/vaults/**.md",
    },
    keys = {
        { "<Leader>oq", "<Cmd>Obsidian quick_switch<CR>", silent = true, desc = "Open note" },
        {
            "<Leader>ow",
            function()
                local Workspace = require("obsidian.workspace")
                local workspace_names = vim.tbl_map(
                    function(ws)
                        return ws.name
                    end,
                    vim.tbl_filter(function(ws)
                        return ws.name ~= ".obsidian.wiki"
                    end, Obsidian.workspaces)
                )

                require("fzf-lua").fzf_exec(workspace_names, {
                    prompt = "Obsidian Workspace> ",
                    actions = {
                        ["default"] = function(selected)
                            if selected and selected[1] then
                                Workspace.set(selected[1])
                            end
                        end,
                    },
                })
            end,
            silent = true,
            desc = "Switch Obsidian [W]orkspace",
        },
    },
    opts = {
        legacy_commands = false,
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
            nvim_cmp = false,
            blink = false,
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

        link = {
            style = "markdown",
        },

        image_name_func = function()
            -- Prefix image names with timestamp.
            return string.format("%s-", os.time())
        end,

        frontmatter = {
            func = function(note)
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
        },

        templates = {
            folder = "99_Templates",
            date_format = "%Y-%m-%d",
            time_format = "%H-%M",
        },

        picker = {
            name = "fzf-lua",
            mappings = {
                new = "<C-x>",
                insert_link = "<C-l>",
            },
        },

        callbacks = {
            post_set_workspace = function(workspace)
                vim.cmd.cd(tostring(workspace.path))
            end,
        },

        attachments = {
            folder = "97_Assets",
        },

        ui = { enable = false },
    },
}
