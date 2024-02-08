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

        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },

        notes_subdir = "00_Inbox",

        note_id_func = function(title)
            -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
            -- In this case a note with the title 'My new note' will be given an ID that looks
            -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
            local suffix = ""
            if title ~= nil then
                -- If title is given, transform it into valid file name.
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                -- If title is nil, just add 4 random uppercase letters to the suffix.
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return tostring(os.time()) .. "-" .. suffix
        end,

        templates = {
            subdir = "99_Templates",
        },

        open_app_foreground = true,
        follow_url_func = function(url)
            vim.fn.jobstart({ "xdg-open", url })
        end,

        finder = "telescope.nvim",

        finder_mappings = {
            new = "<C-x>",
        },
    },
}
