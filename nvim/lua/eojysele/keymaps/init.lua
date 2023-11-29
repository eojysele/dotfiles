local P = {}

--------------------------
-- General keys mapping --
--------------------------
vim.g.mapleader = " "
local key = require("eojysele.keymaps.utils")

-- Window management
-- Splits
key.set("n", "<leader>sd", "<C-w>v")     -- split window vertically
key.set("n", "<leader>sD", "<C-w>s")     -- split window horizontally
key.set("n", "<leader>s=", "<C-w>=")     -- make split windows equal width & height
key.set("n", "<leader>sj", "<C-w>j")     -- to lower split
key.set("n", "<leader>sk", "<C-w>k")     -- to upper split
key.set("n", "<leader>sh", "<C-w>h")     -- to left split
key.set("n", "<leader>sl", "<C-w>l")     -- to right split
key.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- Buffers
key.set("n", "<leader>bx", ":bdelete<CR>")            -- close current buffer
key.set("n", "<leader>bX", ":bdelete!<CR>")           -- close current buffer

key.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")  -- toggle file explorer
key.set("n", "<leader>so", "<cmd>SymbolsOutline<CR>") -- toggle outline

-- LSP
local lsp_buf = vim.lsp.buf

key.set("n", "gd", lsp_buf.definition)                                    -- go to definition
key.set("n", "gD", lsp_buf.declaration)                                   -- go to declaration
key.set("n", "gr", lsp_buf.references)                                    -- list of references
key.set("n", "gi", lsp_buf.implementation)                                -- go to implementation
key.set("n", "<leader>St", lsp_buf.hover)                                 -- show hover text
key.set("n", "<leader>Ss", lsp_buf.signature_help)                        -- show signature
key.set("n", "<leader>rn", lsp_buf.rename)                                -- rename
key.set("n", "<leader>ca", lsp_buf.code_action)                           -- code actions
key.set("n", '<leader>F', function() lsp_buf.format { async = true } end) -- format file

-- Searching
local builtin = require("telescope.builtin")
key.set("n", "<leader>ff", builtin.live_grep)                                    -- grep
key.set("n", "<leader>fF", builtin.find_files)                                   -- find file
key.set("n", "<leader>fb", builtin.buffers)                                      -- find buffer
key.set("n", "<leader>fm", builtin.marks)                                        -- find mark
key.set("n", "<leader>fd", function() builtin.diagnostics({ bufnr = 0 }) end)    -- find diagnostics in buffer
key.set("n", "<leader>fD", builtin.diagnostics)                                  -- find all diagnostics
key.set("n", "<leader>fg", builtin.git_status)                                   -- list files with diff
key.set("n", "<leader>fB", require("telescope").extensions.dap.list_breakpoints) -- list breakpoints

-- Debug
local dap = require("dap")
local dap_ui = require("dap.ui.widgets")
key.set("n", "<leader>Bb", dap.toggle_breakpoint)                               -- set breakpoint
key.set("n", "<leader>Bx", dap.clear_breakpoints)                               -- clear breakpoints
key.set("n", "<leader>Dc", dap.continue)                                        -- continue
key.set("n", "<leader>Do", dap.step_over)                                       -- step over
key.set("n", "<leader>Di", dap.step_into)                                       -- step into
key.set("n", "<leader>DO", dap.step_out)                                        -- step out
key.set("n", "<leader>Dv", dap_ui.hover)                                        -- variables
key.set("n", "<leader>Ds", function() dap_ui.centered_float(dap_ui.scopes) end) -- scopes

---------------
-- ON ATTACH --
-- NvimTree
function P.tree_keymaps(bufnr)
    key.delete('n', 'f', bufnr)
    key.delete('n', 'F', bufnr)
end

-- Gitsings
function P.gitsings_keymaps(bufnr, gs)
    key.set("n", "<leader>do", gs.diffthis)                                                              -- open diff in split
    key.set("n", "<leader>hp", gs.preview_hunk)                                                          -- preview change
    key.set("n", "<leader>hs", gs.stage_hunk)                                                            -- add changes in current line
    key.set("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end)      -- add changes in selected lines
    key.set("n", "<leader>hr", gs.reset_hunk)                                                            -- reset changes in current line
    key.set("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end)      -- reset changes in selected lines
    key.set("n", "<leader>hu", gs.undo_stage_hunk)                                                       -- undo adding changes in current line
    key.set("v", "<leader>hu", function() gs.undo_stage_hunk { vim.fn.line("."), vim.fn.line("v") } end) -- undo adding changes in selected lines
end

-- Java
function P.java_keymaps(bufrn, jdtls)
    key.set("n", "<leader>ji", jdtls.organize_imports)    -- organize imports
    key.set("n", "<leader>tc", jdtls.test_class)          -- test class
    key.set("n", "<leader>tm", jdtls.test_nearest_method) -- test method
end

return P
