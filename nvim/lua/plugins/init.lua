-- Without options
require("nvim-web-devicons").setup()
require("gitsigns").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("nvim-autopairs").setup()
require("Comment").setup()

-- Load
require("dap.ext.vscode").load_launchjs()

-- Plugins directory
require("plugins.tree")
require("plugins.lualine")
require("plugins.symbols-outline")
require("plugins.telescope")
require("plugins.lspconfig")
require("plugins.cmp")
require("plugins.treesitter")


