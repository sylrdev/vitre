local UILabs = require("../../DevPackages/UILabs")
local Vide = require("../../Packages/Vide")
local Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,

	controls = {
		Checked = true,
	},

	story = function(props: UILabs.VideProps)
		return Vitre.Widget.CheckBox {
			Text = "Checkbox",
			Checked = props.controls["Checked"],
		}
	end,
}
