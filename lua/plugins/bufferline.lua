return {
    "akinsho/bufferline.nvim",
    lazy = false,
    version = "*",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", opts = {} }
    },
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            show_buffer_icons = false,
            show_buffer_close_icons = false,
            show_tab_indicators = true,
            separator_style = "thin",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                if context.buffer:current() then
                    return ""
                end

                local icon = level:match("error") and " " or " "
                return icon .. count
            end,
        }
    }
}
