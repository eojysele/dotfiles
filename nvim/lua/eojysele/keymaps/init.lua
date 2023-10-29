local P = {}

vim.g.mapleader = " "

-- Key_mapping --
local key_map = function(mode, key, result)
    vim.keymap.set(mode, key, result)
end

--------------------------
-- General keys mapping --
--------------------------
-- Window management
-- Splits
key_map("n", "<leader>sd", "<C-w>v")     -- split window vertically
key_map("n", "<leader>sD", "<C-w>s")     -- split window horizontally
key_map("n", "<leader>s=", "<C-w>=")     -- make split windows equal width & height
key_map("n", "<leader>sj", "<C-w>j")     -- to lower split
key_map("n", "<leader>sk", "<C-w>k")     -- to upper split
key_map("n", "<leader>sh", "<C-w>h")     -- to left split
key_map("n", "<leader>sl", "<C-w>l")     -- to right split
key_map("n", "<leader>sx", ":close<CR>") -- close current split window

-- Buffers
key_map("n", "<leader>bx", ":bdelete<CR>")  -- close current buffer
key_map("n", "<leader>bX", ":bdelete!<CR>") -- close current buffer

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
key_map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- Symbols-outline
key_map("n", "<leader>so", "<cmd>SymbolsOutline<CR>")

-- Default keys (lsp)
local lsp_buf = vim.lsp.buf
key_map("n", "gd", lsp_buf.definition)                                    -- go to definition
key_map("n", "gD", lsp_buf.declaration)                                   -- go to declaration
key_map("n", "gr", lsp_buf.references)                                    -- list of references
key_map("n", "gi", lsp_buf.implementation)                                -- go to implementation
key_map("n", "<leader>St", lsp_buf.hover)                                 -- show hover text
key_map("n", "<leader>Ss", lsp_buf.signature_help)                        -- show signature
key_map("n", "<leader>rn", lsp_buf.rename)                                -- rename
key_map("n", "<leader>ca", lsp_buf.code_action)                           -- code actions
key_map("n", '<leader>F', function() lsp_buf.format { async = true } end) -- format file

-- Debug
local dap = require("dap")
local dap_ui = require("dap.ui.widgets")
key_map("n", "<leader>Bb", dap.toggle_breakpoint)                               -- set breakpoint
key_map("n", "<leader>Bx", dap.clear_breakpoints)                               -- clear breakpoints
key_map("n", "<leader>Dc", dap.continue)                                        -- continue
key_map("n", "<leader>Do", dap.step_over)                                       -- step over
key_map("n", "<leader>Di", dap.step_into)                                       -- step into
key_map("n", "<leader>DO", dap.step_out)                                        -- step out
key_map("n", "<leader>Dv", dap_ui.hover)                                        -- variables
key_map("n", "<leader>Ds", function() dap_ui.centered_float(dap_ui.scopes) end) -- scopes

-- Searching
local builtin = require("telescope.builtin")
key_map("n", "<leader>f", builtin.live_grep)                                     -- grep
key_map("n", "<leader>ff", builtin.find_files)                                   -- find file
key_map("n", "<leader>fb", builtin.buffers)                                      -- find buffer
key_map("n", "<leader>fm", builtin.marks)                                        -- find mark
key_map("n", "<leader>fd", function() builtin.diagnostics({ bufnr = 0 }) end)    -- find diagnostics in buffer
key_map("n", "<leader>fD", builtin.diagnostics)                                  -- find all diagnostics
key_map("n", "<leader>fB", require("telescope").extensions.dap.list_breakpoints) -- list breakpoints

--------------------------------------
-- Unique keys mapping for language --
--------------------------------------
-- Java
function P.java_key_map(bufnr, jdtls)
    key_map("n", "<leader>ji", jdtls.organize_imports)    -- organize imports
    key_map("n", "<leader>tc", jdtls.test_class)          -- test class
    key_map("n", "<leader>tm", jdtls.test_nearest_method) -- test method
end

return P
