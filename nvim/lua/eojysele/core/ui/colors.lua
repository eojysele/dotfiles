local COLORS = {}

function COLORS.get_palette()
	local palette = require("catppuccin").flavour;

	return require("catppuccin.palettes").get_palette(palette)
end

return COLORS
