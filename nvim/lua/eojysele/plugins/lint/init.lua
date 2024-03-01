local format = "[%tRROR] %f:%l:%c: %m, [%tRROR] %f:%l: %m, [%tARN] %f:%l:%c: %m, [%tARN] %f:%l: %m"

local lint = require("lint")

lint.linters_by_ft = {
	java = { "checkstyle", }
}

local checkstyle_config_file = "checkstyle.xml"
lint.linters.checkstyle = {
	cmd = "checkstyle",
	stdin = false,
	append_fname = true,
	args = { "-c", checkstyle_config_file },
	stream = "both",
	ignore_exitcode = true,
	env = nil,
	config_file = checkstyle_config_file,
	parser = require("lint.parser").from_errorformat(format, {
		source = "checkstyle",
	}),
}

local autocmd_events = {
	"BufEnter",
	"BufWritePost"
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd(autocmd_events, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})
