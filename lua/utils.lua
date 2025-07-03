local utils = {}

--- Map a keybind to the parameters specified
function utils.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--- Check if cwd is a git repo and top-level dir
function utils.telescope_if_git()
    local use_git_files = false

    local inside_work_tree = vim.fn.system("git rev-parse --is-inside-work-tree")
    if inside_work_tree == "true\n" then
        local cwd = vim.loop.cwd()
        local top_level = vim.fn.system("git rev-parse --show-toplevel")
        if top_level == cwd .. "\n" then
            use_git_files = true
        end
    end

    if use_git_files then
        utils.map("n", "<C-q>", "<cmd>Telescope git_files<cr>")
    else
        utils.map("n", "<C-q>", "<cmd>Telescope find_files<cr>")
    end
end

--- Clear the terminal's buffer
function utils.clear_terminal()
    vim.bo.scrollback = 1
    local ctrl_c = vim.api.nvim_replace_termcodes("<C-c>", true, false, true)
    vim.api.nvim_feedkeys(ctrl_c .. "clear\r", "n", true)
    vim.cmd("sleep 100m")
    vim.bo.scrollback = 10000
end

return utils
