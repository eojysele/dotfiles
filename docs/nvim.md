# Neovim

## Список плагинов

1. [folke/lazy.nvim](https://github.com/folke/lazy.nvim)
2. [catppuccin/nvim](https://github.com/catppuccin/nvim)
3. [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
4. [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
5. [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
6. [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
7. [simrat39/symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)
8. [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
9. [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
10. [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
11. [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
12. [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
13. [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
14. [mfussenegger/nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)
14. [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
16. [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
17. [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
18. [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
19. [hrsh7th/cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip)
20. [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip)
21. [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
22. [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)

## Пакеты из Mason 

1. jdtls
2. java-debug-adapter
3. java-test
4. lua-language-server
5. html-lsp
6. marksman
7. lemminx (на Apple Silicon требует Rosetta) 
8. json-lsp (jsonls)
9. yaml-language-server
10. dockerfile-language-server

## Отладка

В корневой директории проекта создать директорию _.vscode_ (если она отсутствует). 
В директорию _.vscode_ скопировать файл _lauch.json_ из _nvim/debug-settings/<language-name>/_
