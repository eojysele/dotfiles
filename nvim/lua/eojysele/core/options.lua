local g = vim.g
local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

g.mapleader = " "
opt.mousemodel = "extend"

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 0
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.colorcolumn = "+1"
opt.scrolloff = 0
opt.foldmethod = "manual"

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")

opt.list = true
opt.listchars:append("space:·")
opt.listchars:append("trail:·")
opt.listchars:append("tab:│ ")
opt.listchars:append("eol:󱞤")

opt.splitright = true
opt.splitbelow = true
opt.showtabline = 1

opt.swapfile = false

autocmd("VimEnter", { command = "clearjumps" })
