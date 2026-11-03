const UILabs = require("../../DevPackages/UILabs")
const Vide = require("../../Packages/Vide")
const Vitre = require("../../Packages/Vitre")
const Theme = require("../../Packages/Vitre/Theme")

return {
	vide = Vide,
	controls = {
		Text = "Text Widget",
		Color = UILabs.RGBA(Theme().Color.Text),
		Rich = true,
		Wrapped = true,
	},
	story = function(props: UILabs.VideProps)
		return Vitre.Widget.Text {
			Text = props.controls["Text"],
			Color = function()
				return props.controls["Color"]()["Color"]
			end,
			Rich = props.controls["Rich"],
			Wrapped = props.controls["Wrapped"],
		}
	end,
}
