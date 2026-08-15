local allowed_servers = {
    "ts_ls", "ruff", "ty", "clangd", "slangd",
    "gopls", "protols", "basedpyright",
    "rust_analyzer", "lua_ls", "elixirls",
}

return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        "nvim-lua/lsp-status.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })
        vim.api.nvim_create_user_command("LspStart", function(info)
            local servers = info.fargs

            if #servers == 0 then
                local filetype = vim.bo.filetype
                for _, name in ipairs(allowed_servers) do
                    local config = vim.lsp.config[name]
                    if config and config.filetypes and vim.tbl_contains(config.filetypes, filetype) then
                        table.insert(servers, name)
                    end
                end
            else
                local rejected = vim.tbl_filter(function(s)
                    return not vim.tbl_contains(allowed_servers, s)
                end, servers)
                servers = vim.tbl_filter(function(s)
                    return vim.tbl_contains(allowed_servers, s)
                end, servers)
                for _, name in ipairs(rejected) do
                    vim.notify("[LSP] Server not in allowlist: " .. name, vim.log.levels.WARN)
                end
            end

            if #servers == 0 then
                local filetype = vim.bo.filetype
                vim.notify("[LSP] No allowed server matches filetype: " .. (filetype ~= "" and filetype or "(none)"), vim.log.levels.WARN)
                return
            end

            vim.lsp.enable(servers)
        end, {
            desc = "Enable and launch an allowed language server",
            nargs = "*",
            complete = function(arg)
                return vim.tbl_filter(function(s)
                    return s:sub(1, #arg) == arg
                end, allowed_servers)
            end,
        })
    end
}
