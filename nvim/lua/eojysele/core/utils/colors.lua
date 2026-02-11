local C = {}

function C.get_palette()
	local flavour = require("catppuccin").flavour
	local palette = require("catppuccin.palettes").get_palette(flavour)

	return palette
end

return C
