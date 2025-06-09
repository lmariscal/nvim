return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp", opts = { } },
        { "hrsh7th/nvim-cmp", opts = { } },
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "nvim-lua/lsp-status.nvim"
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require('lspconfig')

        local lsp_servers = { "ts_ls", "ruff", "clangd", "slangd" }

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

        lspconfig.basedpyright.setup {
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
        }

        --

        local cmp = require("cmp")
        cmp.setup {
            mapping = cmp.mapping.preset.insert({
                ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
                ["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
                ["<CR>"] = cmp.mapping.confirm({ select = true, }),
            }),
            sources = {
                { name = "nvim_lsp" },
            },
        }
    end
}
