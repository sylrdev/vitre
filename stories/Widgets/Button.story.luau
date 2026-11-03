const UILabs = require("../../DevPackages/UILabs")
const Vide = require("../../Packages/Vide")
const Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,
	controls = {
		Text = "Button Widget",
	},
	story = function(props: UILabs.VideProps)
		return Vitre.Widget.Button {
			Text = props.controls["Text"],
			Activated = function()
				print("Hello World!")
			end,
		}
	end,
}
