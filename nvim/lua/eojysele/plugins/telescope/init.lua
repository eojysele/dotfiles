local telescope = require("telescope")

telescope.setup({
    defaults = {
        layout_strategy = "vertical",
        dynamic_preview_title = true,
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
})

telescope.load_extension("fzf")
