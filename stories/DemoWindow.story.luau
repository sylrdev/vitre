const UILabs = require("../DevPackages/UILabs")
const Tailwind = require("../Packages/Tailwind")
const Vide = require("../Packages/Vide")
const Vitre = require("../Packages/Vitre")

const source = Vide.source

return {
	vide = Vide,
	story = function()
		Vitre:overrideUserInput(UILabs.Environment.UserInput)

		local textBoxText = source("")

		return Vitre.Window {
			Title = "Demo Window",
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

					Vitre.Widget.TextBox {
						Text = textBoxText,
					},

					Vitre.Widget.Text {
						Text = function()
							return string.format("Text Box content: %s", textBoxText())
						end,
					},
				},
			},
		}
	end,
}
