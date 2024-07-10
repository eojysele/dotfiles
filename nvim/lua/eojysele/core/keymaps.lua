local P = {}

local function set(mode, key, result)
	vim.keymap.set(mode, key, result)
end

local function delete(mode, key, bufnr)
	vim.keymap.del(mode, key, { buffer = bufnr })
end

--------------------------
-- General keys mapping --
--------------------------
function P.general_keymaps()
	set("n", "<leader>=", "<C-a>")
	set("n", "<leader>-", "<C-x>")

	-- Window management
	-- Splits
	set("n", "<leader>sd", "<C-w>v")  -- split window vertically
	set("n", "<leader>sD", "<C-w>s")  -- split window horizontally
	set("n", "<leader>s=", "<C-w>=")  -- make split windows equal width & height
	set("n", "<leader>sj", "<C-w>j")  -- to lower split
	set("n", "<leader>sk", "<C-w>k")  -- to upper split
	set("n", "<leader>sh", "<C-w>h")  -- to left split
	set("n", "<leader>sl", "<C-w>l")  -- to right split
	set("n", "<leader>sx", ":close<CR>") -- close current split window

	-- Buffers
	set("n", "<leader>bx", ":bdelete<CR>")        -- close current buffer
	set("n", "<leader>bX", ":bdelete!<CR>")       -- close current buffer

	set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>") -- toggle file explorer

	-- LSP
	local lsp_buf = vim.lsp.buf

	set("n", "gd", lsp_buf.definition)                                 -- go to definition
	set("n", "gD", lsp_buf.declaration)                                -- go to declaration
	set("n", "gr", lsp_buf.references)                                 -- list of references
	set("n", "gi", lsp_buf.implementation)                             -- go to implementation
	set("n", "<leader>Sh", lsp_buf.hover)                              -- show hover text
	set("n", "<leader>Ss", lsp_buf.signature_help)                     -- show signature
	set("n", "<leader>R", lsp_buf.rename)                              -- rename
	set("n", "<leader>ca", lsp_buf.code_action)                        -- code actions
	set("n", '<leader>F', function() lsp_buf.format { async = true } end) -- format file
	set("v", '<leader>f', function() lsp_buf.format { async = true } end) -- format selected in visual mode
	set("n", "<leader>Sd", function() vim.diagnostic.open_float() end) -- show diagnostics

	-- Linting
	local lint = require("lint")
	set("n", "<leader>l", function() lint.try_lint() end) -- try ling current file (buffer)

	-- Searching
	local builtin = require("telescope.builtin")
	set("n", "<leader>fF", builtin.current_buffer_fuzzy_find)              -- current buffer
	set("n", "<leader>ff", builtin.live_grep)                              -- grep
	set("n", "<leader>fn", builtin.find_files)                             -- find file
	set("n", "<leader>fb", builtin.buffers)                                -- find buffer
	set("n", "<leader>fm", builtin.marks)                                  -- find mark
	set("n", "<leader>fd", function() builtin.diagnostics({ bufnr = 0 }) end) -- find diagnostics in buffer
	set("n", "<leader>fD", builtin.diagnostics)                            -- find all diagnostics
	set("n", "<leader>fg", builtin.git_status)                             -- list files with diff
end

---------------
-- ON ATTACH --
-- NvimTree
function P.tree_keymaps(bufnr)
	delete('n', 'e', bufnr)
	delete('n', 'f', bufnr)
	delete('n', 'F', bufnr)
end

-- Gitsings
function P.gitsings_keymaps(bufnr, gs)
	set("n", "<leader>do", gs.diffthis)                                                           -- open diff in split
	set("n", "<leader>hp", gs.preview_hunk)                                                       -- preview change
	set("n", "<leader>hs", gs.stage_hunk)                                                         -- add changes in current line
	set("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end)   -- add changes in selected lines
	set("n", "<leader>hr", gs.reset_hunk)                                                         -- reset changes in current line
	set("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end)   -- reset changes in selected lines
	set("n", "<leader>hu", gs.undo_stage_hunk)                                                    -- undo adding changes in current line
	set("v", "<leader>hu", function() gs.undo_stage_hunk { vim.fn.line("."), vim.fn.line("v") } end) -- undo adding changes in selected lines
end

function P.ts_context_keymaps(bufrn)
	set("n", "<leader>tu", function()
		require("treesitter-context").go_to_context(vim.v.count1)
	end)
	set("n", "<leader>tt", "<cmd>TSContextToggle<CR>")
end

-- Java
function P.java_keymaps(bufrn, jdtls)
	set("n", "<leader>oi", jdtls.organize_imports) -- organize imports
	set("n", "<leader>tc", jdtls.test_class)       -- test class
	set("n", "<leader>tm", jdtls.test_nearest_method) -- test method
end

return P
