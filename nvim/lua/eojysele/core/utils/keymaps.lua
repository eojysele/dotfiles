local K = {}

local function set(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs)
end

local function delete(mode, lhs, buffer)
	vim.keymap.del(mode, lhs, { buffer = buffer })
end

function K.set_keymaps(keymaps)
	for _, keymap in ipairs(keymaps) do
		set(keymap.mode, keymap.lhs, keymap.rhs)
	end
end

function K.delete_keymaps(keymaps)
	for _, keymap in ipairs(keymaps) do
		delete(keymap.mode, keymap.lhs, keymap.buffer)
	end
end

return K
