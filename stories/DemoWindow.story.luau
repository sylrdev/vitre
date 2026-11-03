const UILabs = require("../DevPackages/UILabs")
const Tailwind = require("../Packages/Tailwind")
const Vide = require("../Packages/Vide")
const Vitre = require("../Packages/Vitre")

return {
	vide = Vide,
	story = function()
		Vitre:overrideUserInput(UILabs.Environment.UserInput)

		return Vitre.Window {
			Children = {
				{
					Vitre.Widget.DividerText {
						Text = "Text Widgets",
					},

					Vitre.Widget.Text {
						Text = "Hello World!",
					},

					Vitre.Widget.Text {
						Text = "<i>Hello World in color and italic!</i> <b>Bold too?</b>",
						Color = Tailwind.purple[500],
						Rich = true,
					},
				},
			},
		}
	end,
}
