local UILabs = require("../DevPackages/UILabs")
local Vide = require("../Packages/Vide")
local Vitre = require("../Packages/Vitre")

return {
	vide = Vide,
	controls = {
		Visible = true,
	},
	story = function(props: UILabs.VideProps)
		Vitre:overrideUserInput(UILabs.Environment.UserInput)

		return Vitre.Window {
			Visible = props.controls["Visible"],
		}
	end,
}
