---@param mapping string
---@param group string
---
---@return table
local function make_entry(mapping, group)
    return {
        mapping,
        group = group,
    }
end

return {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = true,
    priority = 100, -- Ensure Which Key is loaded before a lot of plugins
    init = function()
        local wk = require("which-key")
        wk.add({
            {
                make_entry("<leader>g", "[G]o to"),
                make_entry("<leader>Q", "[Q]uit buffers"),
                make_entry("[", "Previous"),
                make_entry("]", "Next"),
                make_entry("<leader>x", "Trouble"),
                make_entry("<leader>t", "[T]ests"),
                make_entry("<leader>tu", "Tests: [U]I elements"),
                make_entry("<leader>p", "[P]HP"),
                make_entry("<leader>l", "[L]aravel"),
                make_entry("<leader>f", "[F]ind"),
                make_entry("<leader>ft", "Find: [T]ailwind"),
                make_entry("<leader>d", "[D]ebugging"),
                make_entry("<leader>h", "Git: [H]unk"),
                make_entry("<leader>i", "[I]nlay Hints"),
                make_entry("<leader>ri", "Refactor: [I]nline"),
                make_entry("<leader>o", "[O]verseer"),
                make_entry("<leader>c", "[C]ode"),
            },
            {
                mode = { "v", "n" },
                make_entry("<leader>r", "[R]efactor"),
            },
            {
                mode = "v",
                make_entry("<leader>s", "Screenshot"),
                make_entry("<leader>e", "Refactor: [E]xtract"),
                make_entry("<leader>i", "Refactor: [I]nline"),
            },
        })
    end,
}
