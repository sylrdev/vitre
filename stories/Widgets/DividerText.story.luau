local UILabs = require("../../DevPackages/UILabs")
local Vide = require("../../Packages/Vide")
local Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,

	controls = {
		Text = "Vitre Divider Text Widget",
	},

	story = function(props: UILabs.VideProps)
		return Vitre.Widget.DividerText {
			Text = props.controls["Text"],
		}
	end,
}
