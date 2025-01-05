local utils = require("utils")
local add, later = MiniDeps.add, MiniDeps.later

local function keymap(mapping, action, description, buffer, opts)
    opts = opts or {}
    opts.buffer = buffer

    if opts.description then
        opts.description = string.format("LSP: %s", opts.description)
    end

    utils.n_keymap(mapping, action, description, opts)
end

local function on_attach(client, buffer)
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, {
            bufnr = buffer,
        })
    end

    local lsp_pick = function(scope)
        return function()
            MiniExtra.pickers.lsp({
                scope = scope,
            })
        end
    end

    keymap("<C-x>", vim.diagnostic.open_float, "Open diagnostics in float", buffer)
    keymap("<leader>ca", vim.lsp.buf.code_action, "Code [a]ction", buffer)
    keymap("[d", vim.diagnostic.goto_prev, "Go to previous error", buffer)
    keymap("]d", vim.diagnostic.goto_next, "Go to previous error", buffer)
    keymap("<leader>cr", lsp_pick("references"), "Find references", buffer)
    keymap("<leader>ci", lsp_pick("implementation"), "Find implementations", buffer)
    keymap("<leader>cd", lsp_pick("definition"), "Go to definition", buffer)
    keymap("<leader>cs", lsp_pick("document_symbol"), "Go to symbol in document", buffer)
    keymap("<leader>cn", vim.lsp.buf.rename, "Re[n]ame symbol", buffer)
    keymap("<leader>i", function()
        local filter = {
            bufnr = buffer,
        }

        local is_enabled = vim.lsp.inlay_hint.is_enabled(filter)
        vim.lsp.inlay_hint.enable(not is_enabled)
    end, "Toggle [i]nlay hints", buffer)
end

later(function()
    add({
        source = "neovim/nvim-lspconfig",
        depends = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
    })

    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "bashls",
            "cssls",
            "html",
            "intelephense",
            "lua_ls",
            "jsonls",
            "rust_analyzer",
            "tailwindcss",
            "ts_ls",
            "volar",
            "yamlls",
            "zls",
        },
    })

    local config = {
        ts_ls = {
            filetypes = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
                "vue",
            },
            inlay_hint = {
                enable = false,
            },
            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = utils.invoke(function()
                            local registry = require("mason-registry")
                            local plugin_path = registry.get_package("vue-language-server"):get_install_path()
                            return plugin_path .. "/node_modules/@vue/language-server"
                        end),
                        languages = { "vue" },
                    },
                },
                preferences = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                    importModuleSpecifierPreference = "non-relative",
                },
            },
        },
        lua_ls = {
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            "${3rd}/luv/library",
                            unpack(vim.api.nvim_get_runtime_file("", true)),
                        },
                    },
                    hint = {
                        enable = true,
                    },
                    completion = {
                        callSnippet = "Replace",
                    },
                },
            },
        },
        intelephense = {
            filetypes = { "php", "blade" },
            settings = {
                intelephense = {
                    environment = {
                        phpVersion = utils.invoke(function()
                            -- Try to extract PHP version from composer.json
                            if vim.fn.filereadable("composer.json") then
                                local composer_json = vim.fn.json_decode(vim.fn.readfile("composer.json"))
                                local require_block = composer_json.require or {}
                                local php_version = require_block.php or ""

                                local _, _, major, minor = string.find(php_version, "(%d+).(%d+)")

                                if major ~= nil and minor ~= nil then
                                    return string.format("%d.%d.0", major, minor)
                                end
                            end

                            -- Try to extract PHP version from the installed version
                            if vim.fn.executable("php") then
                                local php = io.popen("php -v")

                                if php then
                                    local version_info = php:read("*a")
                                    php:close()

                                    local _, _, major, minor = string.find(version_info, "PHP (%d+).(%d)+")

                                    if major ~= nil and minor ~= nil then
                                        return string.format("%d.%d.0", major, minor)
                                    end
                                end
                            end

                            return "8.3.0"
                        end),
                    },
                    files = {
                        maxSize = 2 * math.pow(1024, 3), -- 2MB
                    },
                },
            },
        },
    }

    require("mason-tool-installer").setup({
        ensure_installed = {
            "eslint_d",
            "prettierd",
            "luacheck",
            "shellcheck",
            "stylua",
        },
    })

    require("mason-lspconfig").setup_handlers({
        function(server_name)
            local server_config = vim.tbl_deep_extend("keep", config[server_name] or {}, {
                capabilities = utils.get_capabilities(),
                on_attach = on_attach,
            })

            require("lspconfig")[server_name].setup(server_config)
        end,
    })

    require("which-key").add({
        mode = "n",
        { "<leader>c", group = "[C]ode" },
    })
end)
