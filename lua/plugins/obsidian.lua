--   _____ _____
--  |  _  |   __|  Piotr Serafin
--  |   __|__   |  https://piotrserafin.dev
--  |__|  |_____|  https://github.com/piotrserafin
--

require("obsidian").setup({
    legacy_commands = false,
    workspaces = {
        { name = "work", path = os.getenv("OBSIDIAN_WORK") },
        { name = "personal", path = os.getenv("OBSIDIAN_PERSONAL") },
    },
    notes_subdir = "00_Inbox",
    daily_notes = {
        folder = "00_Inbox/daily",
        date_format = "%Y-%m-%d",
        default_tags = { "daily" },
        template = "daily.md",
    },
    completion = { min_chars = 2 },
    new_notes_location = "notes_subdir",
    note_id_func = function(title)
        if title ~= nil then
            title = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
            title = tostring(os.time())
        end
        return title
    end,
    link = { style = "markdown" },
    image_name_func = function()
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
        mappings = { new = "<C-x>", insert_link = "<C-l>" },
    },
    callbacks = {
        enter_note = function(_)
            vim.cmd.lcd(tostring(Obsidian.dir))
        end,
    },
    attachments = { folder = "97_Assets" },
    ui = { enable = false },
})

vim.keymap.set("n", "<Leader>oq", "<Cmd>Obsidian quick_switch<CR>", { silent = true, desc = "Open note" })
vim.keymap.set(
    "n",
    "<Leader>ow",
    "<Cmd>Obsidian workspace<CR>",
    { silent = true, desc = "Switch Obsidian [W]orkspace" }
)
