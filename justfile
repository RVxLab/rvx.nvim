default:
    just --list

# Update packages
update:
    #!/usr/bin/env bash
    nvim --headless "+Lazy! sync" +qa

    if [ ! -z "$(git diff --name-only ./lazy-lock.json)" ]
    then
        git add ./lazy-lock.json
        git commit -m "Update plugins" -- ./lazy-lock.json
    fi

