local P = {}

local keymaps_utils = require("cyrillic-keymaps.mapping.utils")

function P.general_keymaps()
	local lsp_buf = vim.lsp.buf
	local lint = require("lint")
	local builtin = require("telescope.builtin")

	local keymaps = {
		{ mode = "n", lhs = "<leader>=", rhs = "<C-a>" },
		{ mode = "n", lhs = "<leader>-", rhs = "<C-x>" },
		{ mode = "n", lhs = "<leader>sd", rhs = "<C-w>v" },
		{ mode = "n", lhs = "<leader>sD", rhs = "<C-w>s" },
		{ mode = "n", lhs = "<leader>s0", rhs = "<C-w>=" },
		{ mode = "n", lhs = "<leader>sh", rhs = "<C-w>h" },
		{ mode = "n", lhs = "<leader>sj", rhs = "<C-w>j" },
		{ mode = "n", lhs = "<leader>sk", rhs = "<C-w>k" },
		{ mode = "n", lhs = "<leader>sl", rhs = "<C-w>l" },
		{ mode = "n", lhs = "<leader>s-", rhs = "20<C-w><" },
		{ mode = "n", lhs = "<leader>s=", rhs = "20<C-w>>" },
		{ mode = "n", lhs = "<leader>s_", rhs = "20<C-w>-" },
		{ mode = "n", lhs = "<leader>s+", rhs = "20<C-w>+" },
		{ mode = "n", lhs = "<leader>sw", rhs = ":close<CR>" },
		{ mode = "n", lhs = "<leader>e", rhs = "<cmd>NvimTreeToggle<CR>" },
		{ mode = "n", lhs = "<leader>fc", rhs = "<cmd>NvimTreeFindFile<CR>" },
		{ mode = "n", lhs = "gd", rhs = lsp_buf.definition },
		{ mode = "n", lhs = "gD", rhs = lsp_buf.declaration },
		{ mode = "n", lhs = "gr", rhs = lsp_buf.references },
		{ mode = "n", lhs = "gi", rhs = lsp_buf.implementation },
		{ mode = "n", lhs = "<leader>ch", rhs = lsp_buf.hover },
		{ mode = "n", lhs = "<leader>cs", rhs = lsp_buf.signature_help },
		{ mode = "n", lhs = "<leader>cd", rhs = vim.diagnostic.open_float },
		{ mode = "n", lhs = "<leader>ca", rhs = lsp_buf.code_action },
		{ mode = "n", lhs = "<leader>cr", rhs = lsp_buf.rename },
		{
			mode = { "n", "v" },
			lhs = "<leader>cf",
			rhs = function()
				lsp_buf.format({ async = true })
			end,
		},
		{ mode = "n", lhs = "<leader>gl", rhs = lint.try_lint },
		{ mode = "n", lhs = "<leader>fb", rhs = builtin.current_buffer_fuzzy_find },
		{ mode = "n", lhs = "<leader>ff", rhs = builtin.live_grep },
		{ mode = "n", lhs = "<leader>fn", rhs = builtin.find_files },
		{ mode = "n", lhs = "<leader>ft", rhs = builtin.builtin },
		{ mode = "n", lhs = "<leader>gn", rhs = ":cnext<CR>" },
		{ mode = "n", lhs = "<leader>gp", rhs = ":cprev<CR>" },
		{ mode = "n", lhs = "<leader>go", rhs = ":copen<CR>" },
		{ mode = "n", lhs = "<leader>gw", rhs = ":cclose<CR>" },
	}

	keymaps_utils.set_keymaps(keymaps)
	keymaps_utils.set_cyrillic_keymaps(keymaps)
end

function P.tree_keymaps(buffer)
	local deleted_keymaps = {
		{ mode = "n", lhs = "e", buffer = buffer },
		{ mode = "n", lhs = "f", buffer = buffer },
		{ mode = "n", lhs = "F", buffer = buffer },
		{ mode = "n", lhs = "<C-e>", buffer = buffer },
	}

	keymaps_utils.delete_list_keymaps(deleted_keymaps)
end

function P.gitsings_keymaps()
	local gs = require("gitsigns")
	local keymaps = {
		{ mode = "n", lhs = "<leader>hn", rhs = gs.next_hunk },
		{ mode = "n", lhs = "<leader>hp", rhs = gs.prev_hunk },
		{ mode = "n", lhs = "<leader>hd", rhs = gs.diffthis },
		{ mode = "n", lhs = "<leader>hP", rhs = gs.preview_hunk },
		{ mode = "n", lhs = "<leader>hs", rhs = gs.stage_hunk },
		{
			mode = "v",
			lhs = "<leader>hs",
			rhs = function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
		},
		{ mode = "n", lhs = "<leader>hr", rhs = gs.reset_hunk },
		{
			mode = "v",
			lhs = "<leader>hr",
			rhs = function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
		},
		{ mode = "n", lhs = "<leader>hu", rhs = gs.undo_stage_hunk },
		{
			mode = "v",
			lhs = "<leader>hu",
			rhs = function()
				gs.undo_stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
		},
	}

	keymaps_utils.set_keymaps(keymaps)
	keymaps_utils.set_cyrillic_keymaps(keymaps)
end

function P.jdtls_keymaps()
	local jdtls = require("jdtls")
	local keymaps = {
		{ mode = "n", lhs = "<leader>ji", rhs = jdtls.organize_imports },
	}

	keymaps_utils.set_keymaps(keymaps)
	keymaps_utils.set_cyrillic_keymaps(keymaps)
end

function P.ts_context_keymaps()
	local ts_context = require("treesitter-context")
	local keymaps = {
		{
			mode = "n",
			lhs = "<leader>tu",
			rhs = function()
				ts_context.go_to_context(vim.v.count1)
			end,
		},
	}

	keymaps_utils.set_keymaps(keymaps)
	keymaps_utils.set_cyrillic_keymaps(keymaps)
end

return P
