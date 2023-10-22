-- Without options
require("nvim-web-devicons").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("nvim-autopairs").setup()
require("Comment").setup()

-- Load
require("dap.ext.vscode").load_launchjs()

-- Plugins directory
require("eojysele.plugins.tree")
require("eojysele.plugins.lualine")
require("eojysele.plugins.gitsigns")
require("eojysele.plugins.symbols-outline")
require("eojysele.plugins.telescope")
require("eojysele.plugins.lspconfig")
require("eojysele.plugins.cmp")
require("eojysele.plugins.treesitter")
