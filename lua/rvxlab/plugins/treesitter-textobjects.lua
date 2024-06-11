return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,

                    keymaps = {
                        -- Assignments
                        ["a="] = { query = "@assignment.outer", desc = "Select around an assignment" },
                        ["i="] = { query = "@assignment.inner", desc = "Select inside an assignment" },
                        ["l="] = { query = "@assignment.lhs", desc = "Select left-hand side of an assignment" },
                        ["r="] = { query = "@assignment.rhs", desc = "Select right-hand side of an assignment" },

                        -- Parameters/Arguments
                        ["aa"] = { query = "@parameter.outer", desc = "Select around an argument/parameter" },
                        ["ai"] = { query = "@parameter.inner", desc = "Select inside an argument/parameter" },

                        -- Conditionals
                        ["ia"] = { query = "@conditional.outer", desc = "Select around a conditional" },
                        ["ii"] = { query = "@conditional.inner", desc = "Select inside a conditional" },

                        -- Loops
                        ["al"] = { query = "@loop.outer", desc = "Select around a loop" },
                        ["il"] = { query = "@loop.inner", desc = "Select inside a loop" },

                        -- Functions/Methods
                        ["af"] = { query = "@call.outer", desc = "Select around a function/method call" },
                        ["if"] = { query = "@call.inner", desc = "Select inside a function/method call" },
                        ["am"] = { query = "@function.outer", desc = "Select around a function/method definition" },
                        ["im"] = { query = "@function.inner", desc = "Select inside a function/method definition" },

                        -- Classes/Structs
                        ["ac"] = { query = "@class.outer", desc = "Select around a class/struct" },
                        ["ic"] = { query = "@class.inner", desc = "Select inside a class/struct" },

                        -- Blocks
                        ["ab"] = { query = "@block.outer", desc = "Select around a block" },
                        ["ib"] = { query = "@block.inner", desc = "Select inside a block" },
                    },
                },
            },
        })
    end,
}
