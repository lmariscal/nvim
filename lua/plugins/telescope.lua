return {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    branch = "0.1.x",
    keys = {
        { "bl",        "<cmd>Telescope buffers theme=get_dropdown<cr>",    desc = "Open buffer selection" },
        { "<C-S-p>",   "<cmd>Telescope projects theme=get_dropdown<cr>",   desc = "Open project selection" },
        { "<leader>f", "<cmd>Telescope live_grep theme=get_dropdown<cr>",  desc = "Open live grep" },
        { "<C-S-q>",   "<cmd>Telescope treesitter theme=get_dropdown<cr>", desc = "Open treesitter selection" },
        { "z=",        "<cmd>Telescope spell_suggest<cr>",                 desc = "Open spell_suggest" },
    },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").load_extension("projects")
        require("telescope").load_extension("notify")
        require("telescope").setup({
            defaults = {
                borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
                mappings = {
                    i = {
                        ["<C-[>"] = actions.close,
                        ["<esc>"] = actions.close,
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    },
                },
                prompt_prefix = " ",
                selection_caret = "> ",
                selection_strategy = "reset",
                layout_strategy = "vertical",
                layout_config = {
                    vertical = {
                        mirror = true,
                    },
                }
            },
            pickers = {
                buffers = {
                    show_all_buffers = true,
                    sort_lastused = true,
                    ignore_current_buffer = true,
                    theme = "dropdown",
                    previewer = false,
                    mappings = {
                        i = {
                            ["<c-d>"] = "delete_buffer",
                        }
                    }
                },
                oldfiles = {
                    theme = "dropdown",
                    previewer = false
                },
                find_files = {
                    theme = "dropdown",
                    previewer = false
                },
                git_files = {
                    theme = "dropdown",
                    previewer = false
                },
                live_grep = {
                    theme = "dropdown"
                },
                treesitter = {
                    theme = "dropdown"
                },
                notify = {
                    theme = "dropdown",
                    previewer = false
                },
                spell_suggest = {
                    theme = "dropdown"
                }
            }
        })
    end
}
