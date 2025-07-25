return {
    "hoob3rt/lualine.nvim",
    lazy = false,
    config = function()
        local lualine = require("lualine")
        local treesitter = require("nvim-treesitter")
        local lsp_status = require("lsp-status")

        lsp_status.register_progress()

        -- Sonokai maia
        -- local colors = {
        --   bg       = "#3a444b",
        --   fg       = "#e1e2e3",
        --   yellow   = "#e3d367",
        --   cyan     = "#008080",
        --   darkblue = "#7cd5f1",
        --   green    = "#9cd57b",
        --   orange   = "#f3a96a",
        --   violet   = "#baa0f8",
        --   magenta  = "#c678dd",
        --   blue     = "#78cee9",
        --   red      = "#f76c7c"
        -- }
        -- Everforest Hard
        local colors = {
          bg       = "#3c474d",
          fg       = "#d8caac",
          yellow   = "#e3d367",
          cyan     = "#87c095",
          darkblue = "#78cee9",
          green    = "#a7c080",
          orange   = "#e39b7b",
          violet   = "#d39bb6",
          magenta  = "#c678dd",
          blue     = "#7cd5f1",
          red      = "#e68183",
        }

        local conditions = {
          buffer_not_empty = function() return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end,
          hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
          check_git_workspace = function()
            local filepath = vim.fn.expand("%:p:h")
            local gitdir = vim.fn.finddir(".git", filepath .. ";")
            return gitdir and #gitdir > 0 and #gitdir < #filepath
          end
        }

        -- Config
        local config = {
          extensions = {
            "fugitive"
          },
          options = {
            -- Disable sections and component separators
            component_separators = "",
            section_separators = "",
            theme = "monokai-pro"
            -- theme = {
            --   -- We are going to use lualine_c an lualine_x as left and
            --   -- right section. Both are highlighted by c theme .  So we
            --   -- are just setting default looks o statusline
            --   normal = {c = {fg = colors.fg, bg = colors.bg}},
            --   inactive = {c = {fg = colors.fg, bg = colors.bg}}
            -- }
          },
          sections = {
            -- these are to remove the defaults
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            -- These will be filled later
            lualine_c = {},
            lualine_x = {}
          },
          inactive_sections = {
            -- these are to remove the defaults
            lualine_a = {},
            lualine_v = {},
            lualine_y = {},
            lualine_z = {},
            lualine_c = {
              {
                "filename",
                condition = conditions.buffer_not_empty,
                color = {fg = colors.fg, gui = "bold"}
              }
            },
            lualine_x = {
              {
                "o:encoding", -- option component same as &encoding in viml
                upper = true, -- I"m not sure why it"s upper case either ;)
                color = {fg = colors.green, gui = "bold"}
              },
              {
                "fileformat",
                upper = true,
                icons_enabled = false, -- I think icons are cool but Eviline doesn"t have them. sigh
                color = {fg = colors.green, gui = "bold"}
              }
            }
          }
        }

        -- Inserts a component in lualine_c at left section
        local function ins_left(component)
          table.insert(config.sections.lualine_c, component)
        end

        -- Inserts a component in lualine_x ot right section
        local function ins_right(component)
          table.insert(config.sections.lualine_x, component)
        end

        -- ins_left {
        --   function()
        --     -- auto change color according to neovims mode
        --     local mode_color = {
        --       n = colors.cyan,
        --       i = colors.green,
        --       v = colors.blue,
        --       [""] = colors.blue,
        --       V = colors.blue,
        --       c = colors.violet,
        --       no = colors.cyan,
        --       s = colors.orange,
        --       S = colors.orange,
        --       [""] = colors.orange,
        --       ic = colors.yellow,
        --       R = colors.red,
        --       Rv = colors.red,
        --       cv = colors.cyan,
        --       ce = colors.cyan,
        --       r = colors.magenta,
        --       rm = colors.magenta,
        --       ["r?"] = colors.magenta,
        --       ["!"] = colors.cyan,
        --       t = colors.cyan
        --     }
        --     vim.api.nvim_command(
        --         -- "hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg)
        --         "hi! LualineMode guifg=" .. mode_color[vim.fn.mode()])
        --     return "▊"
        --   end,
        --   color = "LualineMode", -- Sets highlighting of component
        --   left_padding = 0 -- We don"t need space before this
        -- }

        ins_left {
          "branch",
          icon = "",
          condition = conditions.check_git_workspace,
          color = {fg = colors.cyan, gui = "bold"}
        }

        ins_left {
          "diff",
          -- Is it me or the symbol for modified us really weird
          symbols = {added = "+", modified = "~", removed = "-"},
          color_added = colors.green,
          color_modified = colors.orange,
          color_removed = colors.red,
          condition = conditions.hide_in_width
        }

        ins_left {
          "filename",
          condition = conditions.buffer_not_empty,
          color = {fg = colors.fg, gui = "bold"}
        }

        ins_left {
          "filetype",
          color = { fg = colors.fg, gui = "bold" }
        }

        ins_left {
          "diagnostics",
          sources = {"nvim_diagnostic"},
          symbols = {error = " ", warn = " ", info = ""},
          color_error = colors.red,
          color_warn = colors.yellow,
          color_info = colors.cyan
        }

        ins_left {
          -- Lsp server name .
          function()
            local msg = ""
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then return msg end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
          icon = "",
          color = {fg = colors.fg, gui = "bold"}
        }

        ins_left {
          function()
            return treesitter.statusline({
              indicator_size = 100,
              type_patterns = {'class', 'function', 'method'},
              separator = ' -> '
            })
          end,
          color = {fg = colors.fg, gui = "bold"}
        }

        ins_left {
          function()
            return lsp_status.status()
          end
        }

        -- Add components to right sections
        ins_right {
          "o:encoding", -- option component same as &encoding in viml
          upper = true, -- I"m not sure why it"s upper case either ;)
          color = {fg = colors.green, gui = "bold"}
        }

        ins_right {
          "fileformat",
          upper = true,
          icons_enabled = false, -- I think icons are cool but Eviline doesn"t have them. sigh
          color = {fg = colors.green, gui = "bold"}
        }

        ins_right {
          -- filesize component
          function()
            local function format_file_size(file)
              local size = vim.fn.getfsize(file)
              if size <= 0 then return "" end
              local sufixes = {"b", "k", "m", "g"}
              local i = 1
              while size > 1024 do
                size = size / 1024
                i = i + 1
              end
              return string.format("%.1f%s", size, sufixes[i])
            end
            local file = vim.fn.expand("%:p")
            if string.len(file) == 0 then return "" end
            return format_file_size(file)
          end,
          condition = conditions.buffer_not_empty
        }

        ins_right {"location"}

        ins_right {"progress"}

        -- ins_right {
        --   function() return "▊" end,
        --   color = "LualineMode", -- Sets highlighting of component
        --   right_padding = 0
        -- }

        -- Now don"t forget to initialize lualine
        lualine.setup(config)
    end
}
