require("nvim-tree").setup({
    on_attach = function(bufnr)
        local api = require('nvim-tree.api')
        api.config.mappings.default_on_attach(bufnr)
        require("eojysele.keymaps").tree_keymaps(bufnr)
    end,
    view = {
        adaptive_size = true,
        number = true,
        relativenumber = true,
    },
    renderer = {
        root_folder_label = ":~:t?$?/..?",
        icons = {
            glyphs = {
                modified = "",
                git = {
                    unstaged = "",
                    staged = "",
                    unmerged = "󰀁",
                    renamed = "",
                    untracked = "",
                    deleted = "",
                    ignored = "",
                }
            }
        }
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.ERROR,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    actions = {
        open_file = {
            quit_on_open = true,
        }
    }
})
