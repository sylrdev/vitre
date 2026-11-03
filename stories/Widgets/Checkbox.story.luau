const UILabs = require("../../DevPackages/UILabs")
const Vide = require("../../Packages/Vide")
const Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,
	controls = {
		Checked = true,
	},
	story = function(props: UILabs.VideProps)
		return Vitre.Widget.Checkbox {
			Checked = props.controls["Checked"],
			Text = "Checkbox Widget",
		}
	end,
}
