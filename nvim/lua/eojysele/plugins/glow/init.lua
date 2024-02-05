local mason_bin = vim.fn.stdpath('data') .. "/mason/bin/"

require("glow").setup({
    glow_path = mason_bin .. "glow",
    install_path = mason_bin,
    border = "rounded",
    style = "dark",
    width_ratio = 0.6,
    height_ratio = 0.8,

})
