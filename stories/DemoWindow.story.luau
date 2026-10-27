local UILabs = require("../DevPackages/UILabs")
local Vide = require("../Packages/Vide")
local Vitre = require("../Packages/Vitre")

local source = Vide.source

return {
	vide = Vide,
	story = function(props: UILabs.VideProps)
		Vitre:setUserInputService(UILabs.Environment.UserInput)
		Vitre:setWindowContainer(props.target)

		local textboxText = source("")
		local clickCount = source(0)
		local radioButtonIndex = source(1)

		return Vitre.Window {
			Title = "Demo Window",
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

				Vitre.Widget.Divider {},

				Vitre.Widget.SameLine {
					Children = {
						Vitre.Widget.Text {
							Text = "Same Line Hello World!",
						},

						Vitre.Widget.Text {
							Text = "Same Line Hello World!",
						},
					},
				},

				Vitre.Widget.DividerText {
					Text = "Hello World!",
				},

				Vitre.Widget.SameLine {
					Children = {
						Vitre.Widget.TextBox {
							Text = textboxText,
							Width = 150,
						},

						Vitre.Widget.Text {
							Text = function()
								return string.format("You entered: %s", textboxText())
							end,
						},
					},
				},

				Vitre.Widget.SameLine {
					Children = {
						Vitre.Widget.Button {
							Text = "Click me!",

							Activated = function()
								clickCount(clickCount() + 1)
							end,
						},

						Vitre.Widget.Text {
							Text = function()
								return string.format("Clicked %i times", clickCount())
							end,
						},
					},
				},

				Vitre.Widget.CheckBox {
					Text = "Option 1",
					Checked = source(false),
				},

				Vitre.Widget.CheckBox {
					Text = "Option 2",
					Checked = source(false),
				},

				Vitre.Widget.CheckBox {
					Text = "Option 3",
					Checked = source(false),
				},

				Vitre.Widget.RadioButton {
					Text = "Option 1",
					Index = 1,
					CurrentIndex = radioButtonIndex,
				},

				Vitre.Widget.RadioButton {
					Text = "Option 2",
					Index = 2,
					CurrentIndex = radioButtonIndex,
				},

				Vitre.Widget.RadioButton {
					Text = "Option 3",
					Index = 3,
					CurrentIndex = radioButtonIndex,
				},

				Vitre.Widget.Text {
					Text = function()
						return string.format("Selected: %i", radioButtonIndex())
					end,
				},
			},
		}
	end,
}
