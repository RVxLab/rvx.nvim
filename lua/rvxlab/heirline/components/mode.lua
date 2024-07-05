return {
    static = {
        mode_display = {
            n = "NRM",
            i = "INS",
            t = "TER",
            c = "CMD",
            v = "VIS",
            r = "RPL",
        },
        mode_colors = {
            n = "blue",
            i = "green",
            t = "green",
            c = "orange",
            v = "purple",
            r = "red",
        },
    },
    init = function(self)
        self.mode = vim.fn.mode(1):sub(1, 1):lower()
    end,
    provider = function(self)
        return self.mode_display[self.mode]
    end,
    hl = function(self)
        local color = self.mode_colors[self.mode]
        return { fg = color, bg = "bg" }
    end,
    update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
            vim.api.nvim__redraw({
                statusline = true,
            })
        end),
    },
}
