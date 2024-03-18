# Neovim Config

> 🚧 This config is a work in progress, but is somewhat functional!

My Neovim config from scratch

## Features

-   [Catppuccin Frappe 🐈](https://github.com/catppuccin/nvim) colour scheme
-   [Lazy package management](https://github.com/folke/lazy.nvim)
-   Minimal UI using [mini.nvim](https://github.com/echasnovski/mini.nvim)
-   LSP using [Mason](https://github.com/williamboman/mason.nvim)
-   Completion using [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
-   Lazygit integration

## Inspirations

-   [Jess Archer's Dotfiles](https://github.com/jessarcher/dotfiles)
-   [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

## Todo

-   [ ] Finish setting up LSP + Tools
    -   [x] PHP
        -   [x] [PHPActor](https://github.com/phpactor/phpactor)
        -   [x] [PHPStan](https://phpstan.org/)
        -   [x] [Pint](https://laravel.com/docs/10.x/pint)
        -   [x] Add Laravel specific features and snippets
    -   [ ] JavaScript/TypeScript
        -   [x] [ESLint](https://eslint.org)
        -   [x] [Prettier](https://prettier.io)
        -   [ ] [Volar](https://github.com/vuejs/language-tools)
    -   [ ] Rust
        -   [ ] [Rustfmt](https://github.com/rust-lang/rustfmt)
        -   [ ] [Clippy](https://github.com/rust-lang/rust-clippy)
    -   [ ] Set up diagnostics bindings
    -   [ ] Add some more useful LSPs, like JSON, YAML, Markdown, etc
    -   [ ] Fix CMP completion
-   [ ] Add a terminal plugin
-   [ ] Expand keybind registrations in which-key
-   [x] Add a dashboard
-   [ ] Add tons of comments to explain my reasoning so others can use this to learn from
-   [x] Add Stylua to enforce some consistency in here
