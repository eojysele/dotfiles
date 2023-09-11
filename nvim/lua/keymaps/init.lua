local P = {}

-- Set leader key to space
vim.g.mapleader = " "

-- key_mapping --
local key_map = function(mode, key, result)
    vim.keymap.set(mode, key, result)
end

--------------------------
-- General keys mapping --
--------------------------
-- Window management
-- Splits
key_map("n", "<leader>sd", "<C-w>v")      -- split window vertically
key_map("n", "<leader>sD", "<C-w>s")      -- split window horizontally
key_map("n", "<leader>s=", "<C-w>=")     -- make split windows equal width & height
key_map("n", "<leader>sj", "<C-w>j")     -- to lower split
key_map("n", "<leader>sk", "<C-w>k")     -- to upper split
key_map("n", "<leader>sh", "<C-w>h")     -- to left split
key_map("n", "<leader>sl", "<C-w>l")     -- to right split
key_map("n", "<leader>sx", ":close<CR>") -- close current split window

-- Buffers
key_map("n", "<leader>bp", ":bprev<CR>")          -- go to prev buffer
key_map("n", "<leader>bn", ":bnext<CR>")          -- go to next buffer
key_map("n", "<leader>bx", ":bdelete<CR>")        -- close current buffer
-- Gitsigns
function P.gitsings_key_map(bufnr, gs)
    key_map("n", "<leader>do", gs.diffthis)                                                              -- open diff in split
    key_map("n", "<leader>hp", gs.preview_hunk)                                                          -- preview change
    key_map("n", "<leader>hs", gs.stage_hunk)                                                            -- add changes in current line
    key_map("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end)      -- add changes in selected lines
    key_map("n", "<leader>hr", gs.reset_hunk)                                                            -- reset changes in current line
    key_map("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end)      -- reset changes in selected lines
    key_map("n", "<leader>hu", gs.undo_stage_hunk)                                                       -- undo adding changes in current line
    key_map("v", "<leader>hu", function() gs.undo_stage_hunk { vim.fn.line("."), vim.fn.line("v") } end) -- undo adding changes in selected lines
end

-- Nvim-tree
key_map("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- Symbols-outline
key_map("n", "<leader>so", ":SymbolsOutline<CR>")

-- Default keys (lsp)
key_map("n", "gd", vim.lsp.buf.definition)                                    -- go to definition
key_map("n", "gD", vim.lsp.buf.declaration)                                   -- go to declaration
key_map("n", "gr", vim.lsp.buf.references)                                    -- list of references
key_map("n", "gi", vim.lsp.buf.implementation)                                -- go to implementation
key_map("n", "<leader>ht", vim.lsp.buf.hover)                                 -- hover text
key_map("n", "<leader>hs", vim.lsp.buf.signature_help)                        -- show signature
key_map("n", "<leader>rn", vim.lsp.buf.rename)                                -- rename
key_map("n", "<leader>ca", vim.lsp.buf.code_action)                           -- code actions
key_map("n", '<leader>f', function() vim.lsp.buf.format { async = true } end) -- format file

-- Debug
key_map("n", "<leader>Bb", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")                                           -- set breakpoint
key_map("n", "<leader>Bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")        -- set condition breakpoint
key_map("n", "<leader>Bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>") -- set log point
key_map("n", "<leader>Br", "<cmd>lua require'dap'.clear_breakpoints()<CR>")                                           -- clear breakpoints
key_map("n", "<leader>Ba", "<cmd>Telescope dap list_breakpoints<CR>")                                                 -- list breakpoints
key_map("n", "<leader>Dc", "<cmd>lua require'dap'.continue()<CR>")                                                    -- continue
key_map("n", "<leader>Dj", "<cmd>lua require'dap'.step_over()<CR>")                                                   -- step over
key_map("n", "<leader>Dk", "<cmd>lua require'dap'.step_into()<CR>")                                                   -- step into
key_map("n", "<leader>Do", "<cmd>lua require'dap'.step_out()<CR>")                                                    -- step out
key_map("n", "<leader>Dv", function() require "dap.ui.widgets".hover() end)                                           -- variables
key_map("n", "<leader>Ds",
    function()
        local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
    end) -- scopes

-- Searching
key_map("n", "<leader>F", "<cmd>Telescope live_grep<CR>")            -- grep
key_map("n", "<leader>Ff", "<cmd>Telescope find_files<CR>")          -- find file
key_map("n", "<leader>Fb", "<cmd>Telescope buffers<CR>")             -- find buffer
key_map("n", "<leader>Fm", "<cmd>Telescope marks<CR>")               -- find mark
key_map("n", "<leader>Fr", "<cmd>Telescope lsp_references<CR>")      -- find references
key_map("n", "<leader>Fd", "<cmd>Telescope diagnostics bufnr=0<CR>") -- find diagnostics in buffer

--------------------------------------
-- Unique keys mapping for language --
--------------------------------------
-- Java
function P.java_key_map(bufnr)
    local jdtls = require("jdtls")
    key_map("n", "<leader>ji", jdtls.organize_imports)                                      -- organize imports
    key_map("n", "<leader>jv", jdtls.extract_variable)                                      -- extract variable
    key_map("n", "<leader>jc", jdtls.extract_constant)                                      -- extract constant
    key_map("v", "<leader>jm", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]]) -- extract method
    key_map("n", "<leader>tc", jdtls.test_class)                                            -- test class
    key_map("n", "<leader>tm", jdtls.test_nearest_method)                                   -- test method

    -- Spring Boot App
    local spring_app = require('auxiliary-scripts.language.java.run-spring-app')
    key_map("n", "<F9>", function() spring_app.run_spring_boot() end)
    key_map("n", "<F10>", function() spring_app.run_spring_boot(true) end) -- run in debug
end

return P
