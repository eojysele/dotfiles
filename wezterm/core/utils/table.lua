local T = {}

local function merge(destination, source)
	for _, element in ipairs(source) do
		table.insert(destination, element)
	end
end
function T.merge(destination, source)
	return merge(destination, source)
end

function T.safe_merge(destination, source)
	if type(destination) ~= "table" then
		error("safe_merge: dest must be a table")
	end

	if type(source) == "table" then
		merge(destination, source)
	end
end

return T
