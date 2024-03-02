local telescope = require("telescope")

telescope.setup({
    defaults = {
        layout_strategy = "vertical",
        layout_config = {
            width = 0.8,
            height = 0.9,
        },
        dynamic_preview_title = true,
    },
    extensions = {
        fzf = {
            fuzzy = false,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
})

telescope.load_extension("fzf")
