local F = {}

function F.file_is_exists(filename)
	local file = io.open(filename, "r")
	if file ~= nil then
		io.close(file)
		return true
	else
		return false
	end
end

return F
