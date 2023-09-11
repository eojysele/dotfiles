require("gitsigns").setup({
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        require "keymaps".gitsings_key_map(bufnr, gs)
    end
})
