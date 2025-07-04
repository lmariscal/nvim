return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp", opts = {} },
        { "hrsh7th/nvim-cmp",     opts = {} },
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "nvim-lua/lsp-status.nvim"
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require('lspconfig')

        local lsp_servers = { "ts_ls", "ruff", "clangd", "slangd", "gopls" }

        for _, lsp in ipairs(lsp_servers) do
            lspconfig[lsp].setup({
                capabilities = capabilities,
            })
        end

        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            settings = {
                ["rust-analyzer"] = {
                    diagnostics = {
                        enable = false,
                    },
                    checkOnSave = false
                }
            },
            on_attach = function(client, bufnr)
                -- Additional safeguard: Disable semantic tokens on attach
                client.server_capabilities.semanticTokensProvider = nil
            end
        })

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath('config')
                        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                    then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        version = 'LuaJIT',
                        path = {
                            'lua/?.lua',
                            'lua/?/init.lua',
                        },
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                        }
                    }
                })
            end,
            settings = {
                Lua = {}
            }
        })

        lspconfig.basedpyright.setup({
            capabilities = capabilities,
            settings = {
                basedpyright = {
                    analysis = {
                        diagnosticSeverityOverrides = {
                            reportAny = false,
                            reportUnusedCallResult = false,
                            reportMissingTypeArgument = false,
                            reportMissingParameterType = false,
                            reportUnknownArgumentType = false,
                            reportUnknownLambdaType = false,
                            reportUnknownMemberType = false,
                            reportUnknownParameterType = false,
                            reportUnknownVariableType = false,
                            reportMissingTypeStubs = false
                        }
                    }
                }
            }
        })

        --

        local cmp = require("cmp")
        cmp.setup {
            mapping = cmp.mapping.preset.insert({
                ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
                ["<C-d>"] = cmp.mapping.scroll_docs(4),  -- Down
                ["<CR>"] = cmp.mapping.confirm({ select = true, }),
            }),
            sources = {
                { name = "nvim_lsp" },
            },
        }
    end
}
