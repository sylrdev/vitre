local UILabs = require("../DevPackages/UILabs")
local Vide = require("../Packages/Vide")
local Vitre = require("../Packages/Vitre")

return {
	vide = Vide,
	story = function(props: UILabs.VideProps)
		Vitre:setUserInputService(UILabs.Environment.UserInput)
		Vitre:setWindowContainer(props.target)

		return Vitre.Window {
			Children = {
				Vitre.Widget.Text {
					Text = "Hello World!",
				},

				Vitre.Widget.Indent {
					Children = {
						Vitre.Widget.Text {
							Text = "Indented Hello World!",
						},
					},
				},
			},
		}
	end,
}
