local P = {}

function P.set(mode, key, result)
	vim.keymap.set(mode, key, result)
end

function P.delete(mode, key, bufnr)
	vim.keymap.del(mode, key, { buffer = bufnr })
end

return P
