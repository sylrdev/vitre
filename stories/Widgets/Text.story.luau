local UILabs = require("../../DevPackages/UILabs")
local Vide = require("../../Packages/Vide")
local Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,

	controls = {
		Text = "Vitre Text Widget",
	},

	story = function(props: UILabs.VideProps)
		return Vitre.Widget.Text {
			Text = props.controls["Text"],
		}
	end,
}
