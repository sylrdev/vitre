const UILabs = require("../../DevPackages/UILabs")
const Vide = require("../../Packages/Vide")
const Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,
	controls = {
		CurrentIndex = UILabs.Slider(1, 1, 3, 1),
	},
	story = function(props: UILabs.VideProps)
		return Vitre.Widget.RadioButton {
			Index = 1,
			CurrentIndex = props.controls["CurrentIndex"],
			Text = "Radio Button Widget",
		}
	end,
}
