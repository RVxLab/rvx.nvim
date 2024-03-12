-- Set leader to be a space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable line numbers + relative numbers
-- relativenumber gets disabled in insert mode
-- see autocmd.lua
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable highlighting on search
vim.o.hlsearch = true

-- Maintain indentation when wrapping indented lines
vim.o.breakindent = true

-- Add a bit of a scrolling offset to make it easier
-- to see around the current line while scrolling
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5

-- Case-insensitive searching unless \C is specified
vim.o.ignorecase = true
vim.o.smartcase = true

-- Better completion experience, see :help completeopt
vim.o.wildmode = 'longest:full,full'
vim.o.completeopt = 'menuone,longest,preview'

-- Timeouts for plugins like which-key
vim.o.timeout = true
vim.o.timeoutlen = 300

