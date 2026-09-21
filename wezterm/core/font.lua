local F = {
	family = "Iosevka Nerd Font Mono",
	size = 14,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
}

local platform = require("core.utils.platform")

if platform.is_mac then
	F.size = 16
end

return F
