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
	set("n", "<leader>s0", "<C-w>=")  -- make split windows equal width & height
	set("n", "<leader>sh", "<C-w>h")  -- to left split
	set("n", "<leader>sj", "<C-w>j")  -- to lower split
	set("n", "<leader>sk", "<C-w>k")  -- to upper split
	set("n", "<leader>sl", "<C-w>l")  -- to right split
	set("n", "<leader>s-", "20<C-w><") -- decrease width
	set("n", "<leader>s=", "20<C-w>>") -- increase width
	set("n", "<leader>s_", "20<C-w>-") -- decrease height
	set("n", "<leader>s+", "20<C-w>+") -- increase height
	set("n", "<leader>sx", ":close<CR>") -- close current split window

	-- File Tree
	set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

	-- LSP
	local lsp_buf = vim.lsp.buf
	set("n", "gd", lsp_buf.definition)
	set("n", "gD", lsp_buf.declaration)
	set("n", "gr", lsp_buf.references)
	set("n", "gi", lsp_buf.implementation)
	set("n", "<leader>ch", lsp_buf.hover)
	set("n", "<leader>cs", lsp_buf.signature_help)
	set("n", "<leader>cd", function() vim.diagnostic.open_float() end)
	set("n", "<leader>ca", lsp_buf.code_action)
	set("n", "<leader>cr", lsp_buf.rename)

	local format_function = function()
		lsp_buf.format { async = true }
	end
	set({ "n", "v" }, "<leader>cf", format_function)

	-- Linting
	local lint = require("lint")
	set("n", "<leader>cl", function() lint.try_lint() end)

	-- Searching
	local builtin = require("telescope.builtin")
	set("n", "<leader>fb", builtin.current_buffer_fuzzy_find)
	set("n", "<leader>ff", builtin.live_grep)
	set("n", "<leader>fn", builtin.find_files)
	set("n", "<leader>ft", builtin.builtin)
end

---------------
-- ON ATTACH --
-- NvimTree
function P.tree_keymaps(bufnr)
	delete("n", "e", bufnr)
	delete("n", "f", bufnr)
	delete("n", "F", bufnr)
	delete("n", "<C-e>", bufnr)
end

-- Gitsings
function P.gitsings_keymaps(bufnr, gs)
	set("n", "<leader>hd", gs.diffthis)
	set("n", "<leader>hp", gs.preview_hunk)
	set("n", "<leader>hs", gs.stage_hunk)
	set("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end)
	set("n", "<leader>hr", gs.reset_hunk)
	set("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end)
	set("n", "<leader>hu", gs.undo_stage_hunk)
	set("v", "<leader>hu", function() gs.undo_stage_hunk { vim.fn.line("."), vim.fn.line("v") } end)
end

-- Treesitter Context
function P.ts_context_keymaps(bufrn, ts)
	set("n", "<leader>tu", function() ts.go_to_context(vim.v.count1) end)
	set("n", "<leader>tt", "<cmd>TSContextToggle<CR>")
end

return P
