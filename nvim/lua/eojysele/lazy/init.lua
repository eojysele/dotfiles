-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
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
        -- Searching
        "nvim-telescope/telescope.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
        "nvim-lua/plenary.nvim",
        -- LSP
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-jdtls",
        "mfussenegger/nvim-lint",
        { "ellisonleao/glow.nvim",           cmd = "Glow" },
        -- Code highlighting, completion and editing
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
        "windwp/nvim-autopairs",
        "numToStr/Comment.nvim",
    },
    {
        ui = {
            border = "rounded",
            size = {
                width = 0.6,
                height = 0.8,
            }
        },
    }
)
