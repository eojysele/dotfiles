local gpu = {
	max_fps = 60,
	front_end = "OpenGL",
}

local platform = require("core.utils.platform")

if platform.is_windows then
	gpu.max_fps = 144
end

return gpu
