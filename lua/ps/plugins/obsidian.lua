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
        { "<leader>oo", "<Cmd>ObsidianOpen<CR>", desc = "[O]bsidian [O]pen" },
        { "<leader>os", "<Cmd>ObsidianQuickSwitch<CR>", desc = "[O]bsidian [S]witch" },
        { "<leader>of", "<Cmd>ObsidianFollowLink<CR>", desc = "[O]bsidian [F]ollow" },
        { "<leader>ob", "<Cmd>ObsidianBacklinks<CR>", desc = "[O]bsidian [B]acklinks" },
        { "<leader>ot", "<Cmd>ObsidianToday<CR>", desc = "[O]bsidiani [T]oday" },
        { "<leader>oy", "<Cmd>ObsidianYesterday<CR>", desc = "[O]bsidian [Y]esterday" },
        { "<leader>olo", "<Cmd>ObsidianLink<CR>", desc = "[O]bsidian [L]ink [O]pen" },
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
            subdir = "00_Inbox/daily",
            date_format = "%Y-%m-%d",
            template = nil,
        },

        completion = {
            nvim_cmp = true,
            min_chars = 2,
            new_notes_location = "notes_subdir",
        },

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
            subdir = "99_Templates",
            date_format = "%Y-%m-%d-%a",
            time_format = "%H-%M",
            tags = "",
        },

        open_app_foreground = true,
        follow_url_func = function(url)
            vim.fn.jobstart({ "xdg-open", url })
        end,

        finder = "telescope.nvim",

        finder_mappings = {
            new = "<C-x>",
            insert_link = "<C-l>",
        },

        attachments = {
            img_folder = "97_Assets",
        },
    },
}
