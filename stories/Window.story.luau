local UILabs = require("../DevPackages/UILabs")
local Vide = require("../Packages/Vide")
local Vitre = require("../Packages/Vitre")

return {
	vide = Vide,
	controls = {
		Visible = true,
		CanCollapse = true,
		CanDrag = true,
		NoHeader = false,
	},
	story = function(props: UILabs.VideProps)
		Vitre:overrideUserInput(UILabs.Environment.UserInput)

		return Vitre.Window {
			Visible = props.controls["Visible"],
			CanCollapse = props.controls["CanCollapse"],
			CanDrag = props.controls["CanDrag"],
			NoHeader = props.controls["NoHeader"],
		}
	end,
}
