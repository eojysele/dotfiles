require("bufferline").setup {
    options = {
        modified_icon = '',
        indicator = {
            style = 'none',
        },
        offsets = {
            {
                filetype = "NvimTree",
                text = "",
                text_align = "center",
                separator = false

            },
            {
                filetype = "Outline",
                text = "",
                text_align = "center",
                separator = false

            }
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
    },

    highlights = require("catppuccin.groups.integrations.bufferline").get()
}
