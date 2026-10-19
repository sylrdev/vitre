local UILabs = require("../DevPackages/UILabs")
local Vide = require("../Packages/Vide")
local ClampedFrame = require("../Packages/Vitre/ClampedFrame")

return {
	vide = Vide,
	story = function(props: UILabs.VideProps)
		return ClampedFrame {
			_UserInputService = UILabs.Environment.UserInput,
			_Parent = props.target,
		}
	end,
}
