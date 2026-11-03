const UILabs = require("../../DevPackages/UILabs")
const Vide = require("../../Packages/Vide")
const Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,
	controls = {
		Text = "Divider Text Widget",
	},
	story = function(props: UILabs.VideProps)
		return Vitre.Widget.DividerText {
			Text = props.controls["Text"],
		}
	end,
}
