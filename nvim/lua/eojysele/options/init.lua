local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.scrolloff = 999
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.list = true
opt.listchars:append "space:⋅"
opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")
opt.showtabline=0
