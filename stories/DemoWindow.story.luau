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
		local radioButtonIndex = source(1)

		return Vitre.WindowRaw {
			Title = "Demo Window",
			Children = {
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

				Vitre.Widget.Divider {},

				Vitre.Widget.TextBox {
					Text = textBoxText,
				},

				Vitre.Widget.Text {
					Text = function()
						return string.format("Text Box content: %s", textBoxText())
					end,
				},

				Vitre.Widget.DividerText {
					Text = "Formatting",
				},

				Vitre.Widget.Indent {
					Vitre.Widget.Text {
						Text = "Indented Text",
					},
				},

				Vitre.Widget.SameLine {
					Vitre.Widget.Text {
						Text = "Same Line Text",
					},

					Vitre.Widget.TextBox {
						Text = source(""),
					},

					Vitre.Widget.Text {
						Text = "<i><u>Hello World!</u></i>",
						Color = Tailwind.teal[500],
						Rich = true,
					},
				},

				Vitre.Widget.DividerText {
					Text = "Buttons",
				},

				Vitre.Widget.Button {
					Text = "Basic Button",
					Activated = function()
						print("Cookie!")
					end,
				},

				Vitre.Widget.Divider {},

				Vitre.Widget.Checkbox {
					Checked = source(true),
					Text = "Option 1",
				},

				Vitre.Widget.Checkbox {
					Checked = source(false),
					Text = "Option 2",
				},

				Vitre.Widget.Checkbox {
					Checked = source(false),
					Text = "Option 3",
				},

				Vitre.Widget.Divider {},

				Vitre.Widget.RadioButton {
					Index = 1,
					CurrentIndex = radioButtonIndex,
					Text = "Option 1",
				},

				Vitre.Widget.RadioButton {
					Index = 2,
					CurrentIndex = radioButtonIndex,
					Text = "Option 2",
				},

				Vitre.Widget.RadioButton {
					Index = 3,
					CurrentIndex = radioButtonIndex,
					Text = "Option 3",
				},

				Vitre.Widget.Text {
					Text = function()
						return string.format("Selected option: %i", radioButtonIndex())
					end,
				},
			},
		}
	end,
}
