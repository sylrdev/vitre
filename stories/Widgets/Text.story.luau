local UILabs = require("../../DevPackages/UILabs")
local Tailwind = require("../../Packages/Tailwind")
local Vide = require("../../Packages/Vide")
local Vitre = require("../../Packages/Vitre")

return {
	vide = Vide,

	controls = {
		Text = "Vitre Text Widget",
		Color = UILabs.RGBA(Tailwind.white),
		Rich = false,
		Wrapped = false,
	},

	story = function(props: UILabs.VideProps)
		return Vitre.Widget.Text {
			Text = props.controls["Text"],
			Color = function()
				return props.controls["Color"]().Color
			end,
			Rich = props.controls["Rich"],
			Wrapped = props.controls["Wrapped"],
		}
	end,
}
