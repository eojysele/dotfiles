function _G.CustomTabLine()
	local result_tab_line = ""
	local tab_line = "%#TabLine#"
	local tab_line_sel = "%#TabLineSel#"
	local tab_line_fill = "%#TabLineFill#"

	for i = 1, vim.fn.tabpagenr("$") do
		local tabname = vim.fn.fnamemodify(vim.fn.bufname(vim.fn.tabpagebuflist(i)[1]), ":t")
		if tabname == "" then
			tabname = "[No Name]"
		end
		tabname = tabname:gsub(".*%/", "")
		result_tab_line = result_tab_line .. "%" .. i .. "T"
		if i == vim.fn.tabpagenr() then
			result_tab_line = result_tab_line .. tab_line_sel
		else
			result_tab_line = result_tab_line .. tab_line
		end
		result_tab_line = result_tab_line .. " " .. tabname .. " "
	end
	result_tab_line = result_tab_line .. tab_line_fill

	return result_tab_line
end
