require "nvim-treesitter.configs".setup {
    ensure_installed = { "lua", "java", "vim", "html", "json", "xml" },
    sync_install = false,
    highlight = {
        enable = true,
    },
}
