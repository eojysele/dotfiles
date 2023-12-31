-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    -- UI
    { "catppuccin/nvim",                          name = "catppuccin" },
    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-tree.lua",
    "lewis6991/gitsigns.nvim",
    "simrat39/symbols-outline.nvim",

    -- Searching
    "nvim-telescope/telescope.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
    "nvim-telescope/telescope-dap.nvim",
    "nvim-lua/plenary.nvim",

    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-jdtls", -- Java

    -- Debug
    "mfussenegger/nvim-dap",

    -- Code highlighting, completion and editing
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "windwp/nvim-autopairs",
    "numToStr/Comment.nvim"

})

-- Configiration
require("eojysele.options")
require("eojysele.keymaps")
require("eojysele.colorscheme")
require("eojysele.plugins")
