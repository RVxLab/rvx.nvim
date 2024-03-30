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
}
