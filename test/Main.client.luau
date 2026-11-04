const Vitre = require("@game/ReplicatedStorage/Packages/Vitre")

Vitre:setup()
Vitre:append(function()
	return Vitre.Window {
		Children = {
			Vitre.Widget.Text {
				Text = "Hello World!",
			},

			Vitre.Widget.Button {
				Text = "Get Cookies",
				Activated = function()
					print("Cookies!")
				end,
			},
		},
	}
end)
