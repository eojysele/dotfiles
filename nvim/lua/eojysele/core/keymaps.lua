local K = {}

local keymaps_utils = require("eojysele.core.utils.keymaps")

function K.general_keymaps()
	local lsp_buf = vim.lsp.buf
	local telescope_builtin = require("telescope.builtin")

	local keymaps = {
		{ mode = "n", lhs = "<leader>=", rhs = "<C-a>" },
		{ mode = "n", lhs = "<leader>-", rhs = "<C-x>" },
		{ mode = "n", lhs = "<leader>sd", rhs = "<cmd>vsplit<CR>" },
		{ mode = "n", lhs = "<leader>sD", rhs = "<cmd>split<CR>" },
		{ mode = "n", lhs = "<leader>sh", rhs = "<C-w>h" },
		{ mode = "n", lhs = "<leader>sj", rhs = "<C-w>j" },
		{ mode = "n", lhs = "<leader>sk", rhs = "<C-w>k" },
		{ mode = "n", lhs = "<leader>sl", rhs = "<C-w>l" },
		{ mode = "n", lhs = "<leader>s0", rhs = "<C-w>=" },
		{ mode = "n", lhs = "<leader>s-", rhs = "20<C-w><" },
		{ mode = "n", lhs = "<leader>s=", rhs = "20<C-w>>" },
		{ mode = "n", lhs = "<leader>s_", rhs = "20<C-w>-" },
		{ mode = "n", lhs = "<leader>s+", rhs = "20<C-w>+" },
		{ mode = "n", lhs = "<leader>sw", rhs = "<cmd>close<CR>" },
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
		{ mode = "n", lhs = "<leader>fb", rhs = telescope_builtin.buffers },
		{ mode = "n", lhs = "<leader>ff", rhs = telescope_builtin.live_grep },
		{ mode = "n", lhs = "<leader>fn", rhs = telescope_builtin.find_files },
		{ mode = "n", lhs = "<leader>ft", rhs = telescope_builtin.builtin },
		{ mode = "n", lhs = "<leader>gn", rhs = "<cmd>cnext<CR>" },
		{ mode = "n", lhs = "<leader>gp", rhs = "<cmd>cprev<CR>" },
		{ mode = "n", lhs = "<leader>go", rhs = "<cmd>copen<CR>" },
		{ mode = "n", lhs = "<leader>do", rhs = "<cmd>DiffviewOpen<CR>" },
		{ mode = "n", lhs = "<leader>dw", rhs = "<cmd>DiffviewClose<CR>" },
		{ mode = "n", lhs = "<leader>Eu", rhs = "<cmd>e ++encoding=utf-8<CR>" },
		{ mode = "n", lhs = "<leader>Ew", rhs = "<cmd>e ++encoding=cp1251<CR>" },
	}

	keymaps_utils.set_keymaps(keymaps)
end

function K.tree_keymaps(buffer)
	local deleted_keymaps = {
		{ mode = "n", lhs = "e", buffer = buffer },
		{ mode = "n", lhs = "f", buffer = buffer },
		{ mode = "n", lhs = "F", buffer = buffer },
		{ mode = "n", lhs = "<C-e>", buffer = buffer },
	}

	keymaps_utils.delete_keymaps(deleted_keymaps)
end

function K.gitsings_keymaps()
	local gitsigns = require("gitsigns")
	local keymaps = {
		{ mode = "n", lhs = "<leader>hw", rhs = "<cmd>wincmd p | q<CR>" },
		{ mode = "n", lhs = "<leader>hn", rhs = gitsigns.next_hunk },
		{ mode = "n", lhs = "<leader>hp", rhs = gitsigns.prev_hunk },
		{ mode = "n", lhs = "<leader>hd", rhs = gitsigns.diffthis },
		{
			mode = "n",
			lhs = "<leader>hD",
			rhs = function()
				gitsigns.diffthis("~")
			end,
		},
		{ mode = "n", lhs = "<leader>hP", rhs = gitsigns.preview_hunk },
		{ mode = "n", lhs = "<leader>hS", rhs = gitsigns.stage_buffer },
		{ mode = "n", lhs = "<leader>hs", rhs = gitsigns.stage_hunk },
		{
			mode = "v",
			lhs = "<leader>hs",
			rhs = function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
		},
		{ mode = "n", lhs = "<leader>hr", rhs = gitsigns.reset_hunk },
		{ mode = "n", lhs = "<leader>hR", rhs = gitsigns.reset_buffer },
		{
			mode = "v",
			lhs = "<leader>hr",
			rhs = function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
		},
		{ mode = "n", lhs = "<leader>hu", rhs = gitsigns.undo_stage_hunk },
		{
			mode = "v",
			lhs = "<leader>hu",
			rhs = function()
				gitsigns.undo_stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
		},
	}

	keymaps_utils.set_keymaps(keymaps)
end

function K.jdtls_keymaps()
	local jdtls = require("jdtls")
	local keymaps = {
		{ mode = "n", lhs = "<leader>ji", rhs = jdtls.organize_imports },
	}

	keymaps_utils.set_keymaps(keymaps)
end

function K.ts_context_keymaps()
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
end

return K
