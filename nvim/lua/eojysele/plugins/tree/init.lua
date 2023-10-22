require("nvim-tree").setup({
    on_attach = on_attach,
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
        show_on_open_dirs = false,
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
