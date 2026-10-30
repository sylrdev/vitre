local UILabs = require("../../DevPackages/UILabs")
local Vide = require("../../Packages/Vide")
local Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,

	controls = {
		CurrentIndex = 1,
	},

	story = function(props: UILabs.VideProps)
		return Vitre.Widget.RadioButton {
			Text = "Vitre Radio Button Widget",
			Index = 1,
			CurrentIndex = props.controls["CurrentIndex"],
		}
	end,
}
