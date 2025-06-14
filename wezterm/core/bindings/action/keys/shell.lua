local SK = {}

local send_keys = require("core.bindings.action.keys.send_key").get()

function SK.get()
	return {
		BeginningOfLine = send_keys.Ctrl_A,
		EndOfLine = send_keys.Ctrl_E,
		BackwardWord = send_keys.Alt_B,
		ForwardWord = send_keys.Alt_F,
		BackwardKillWord = send_keys.Ctrl_W,
		BackwardKillLine = send_keys.Ctrl_U,
	}
end

return SK
