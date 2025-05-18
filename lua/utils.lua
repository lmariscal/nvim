local utils = {}

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

return utils
