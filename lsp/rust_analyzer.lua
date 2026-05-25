return {
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = false,
            },
            checkOnSave = false,
            inlayHints = {
                enable = false,
            },
        },
    },
    on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil
    end,
}
