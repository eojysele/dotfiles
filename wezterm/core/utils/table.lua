local T = {}

function T.merge(into, from)
	for _, element in ipairs(from) do
		table.insert(into, element)
	end
end

return T
