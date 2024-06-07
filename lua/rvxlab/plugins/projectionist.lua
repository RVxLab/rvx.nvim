return {
    "tpope/vim-projectionist",
    event = { "BufNewFile", "BufReadPost" },
    dependencies = {
        "tpope/vim-dispatch",
    },
    init = function()
        vim.g.projectionist_heuristics = {
            -- Laravel
            artisan = {
                ["app/*.php"] = {
                    type = "source",
                    alternate = {
                        "tests/Unit/{}Test.php",
                        "tests/Feature/{}Test.php",
                    },
                },
                ["tests/Unit/*Test.php"] = {
                    type = "test",
                    alternate = "app/{}.php",
                },
                ["tests/Feature/*Test.php"] = {
                    type = "test",
                    alternate = "app/{}.php",
                },
                ["app/Models/*.php"] = {
                    type = "model",
                },
                ["app/Http/Controllers/*.php"] = {
                    type = "controller",
                },
                ["app/Actions/*.php"] = {
                    type = "action",
                },
                ["routes/*.php"] = {
                    type = "route",
                },
                ["database/migrations/*.php"] = {
                    type = "migration",
                },
            },
            -- TypeScript
            ["tsconfig.json"] = {
                ["*.test.ts"] = {
                    type = "test",
                    alternate = {
                        "{}.ts",
                        "{}.tsx",
                    },
                },
                ["*.test.tsx"] = {
                    type = "test",
                    alternate = {
                        "{}.ts",
                        "{}.tsx",
                    },
                },
                ["*.ts"] = {
                    type = "source",
                    alternate = {
                        "{}.test.ts",
                        "{}.test.tsx",
                    },
                },
                ["*.tsx"] = {
                    type = "source",
                    alternate = {
                        "{}.test.ts",
                        "{}.test.tsx",
                    },
                },
            },
        }
    end,
}
