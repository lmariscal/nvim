return {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    branch = "0.1.x",
    keys = {
        { "bl", "<cmd>Telescope buffers theme=get_dropdown<cr>", desc = "Open buffer selection" },
        { "<C-p>", "<cmd>Telescope projects theme=get_dropdown<cr>", desc = "Open project selection" }
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
                    },
                },
                prompt_prefix = " ",
                selection_caret = "> ",
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
