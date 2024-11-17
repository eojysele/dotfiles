local U = {}

local LEADER = "<leader>"
local keyboard_map = require("eojysele.core.keymaps.keyboard-map")

local function set(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs)
end

function U.set_list_keymaps(keymaps)
	for _, keymap in ipairs(keymaps) do
		set(keymap.mode, keymap.lhs, keymap.rhs)
	end
end

local function replace_keyboard_layout(input)
	return (input:gsub(".", function(char)
		return keyboard_map[char] or char
	end))
end

function U.set_cyrillic_keymaps(keymaps)
	for _, keymap in ipairs(keymaps) do
		local lhs = keymap.lhs
		local cyrillic_lhs = nil
		if string.match(lhs, "<.*>") then
			if string.match(lhs, LEADER) then
				local lhs_witout_leader = string.gsub(lhs, LEADER, "")
				cyrillic_lhs = LEADER .. replace_keyboard_layout(lhs_witout_leader)
			end
		else
			cyrillic_lhs = replace_keyboard_layout(lhs)
		end

		if cyrillic_lhs then
			set(keymap.mode, cyrillic_lhs, keymap.rhs)
		end
	end
end

local function delete(mode, lhs, buffer)
	vim.keymap.del(mode, lhs, { buffer = buffer })
end

function U.delete_list_keymaps(keymaps)
	for _, keymap in ipairs(keymaps) do
		delete(keymap.mode, keymap.lhs, keymap.buffer)
	end
end

return U
