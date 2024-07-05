local conditions = require("heirline.conditions")

return {
    condition = conditions.is_git_repo,
    init = function(self)
        self.git = vim.b.gitsigns_status_dict
        self.has_changes = self.git.added ~= 0 or self.git.removed ~= 0 or self.git.changed ~= 0
    end,
    hl = {
        fg = "orange",
        bg = "bg",
    },

    -- Branch
    {
        provider = function(self)
            return string.format(" %s", self.git.head)
        end,
    },
    -- Changes
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "[",
    },
    {
        provider = function(self)
            local count = self.git.added or 0
            return count > 0 and "+" .. count
        end,
        hl = { fg = "green" },
    },
    {
        provider = " ",
        condition = function(self)
            return self.git.removed ~= 0
        end,
    },
    {
        provider = function(self)
            local count = self.git.removed or 0
            return count > 0 and "-" .. count
        end,
        hl = { fg = "red" },
    },
    {
        provider = " ",
        condition = function(self)
            return self.git.changed ~= 0
        end,
    },
    {
        provider = function(self)
            local count = self.git.changed or 0
            return count > 0 and "~" .. count
        end,
        hl = { fg = "yellow" },
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "]",
    },
}
