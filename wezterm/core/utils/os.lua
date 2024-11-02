local O = {}

local MACOS = {
	APPLE = "aarch64-apple-darwin",
	INTEL = "x86_64-apple-darwin",
}

function O.is_mac_os()
	os = require("wezterm").target_triple
	if os == MACOS.APPLE or os == MACOS.INTEL then
		return true
	else
		return false
	end
end

return O
