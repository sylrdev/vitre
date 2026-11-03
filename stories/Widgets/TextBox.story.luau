const UILabs = require("../../DevPackages/UILabs")
const Vide = require("../../Packages/Vide")
const Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,
	controls = {
		PlaceholderText = "Text Box Widget",
		Text = "",
	},
	story = function(props: UILabs.VideProps)
		return Vitre.Widget.TextBox {
			PlaceholderText = props.controls["PlaceholderText"],
			Text = props.controls["Text"],
		}
	end,
}
