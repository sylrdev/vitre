const Vitre = require("@game/ReplicatedStorage/Packages/Vitre")

Vitre:setup()
Vitre:append(function()
	return Vitre.Window {
		Title = "My Cool Window",
		Children = {
			Vitre.Widget.Button {
				Text = "Get Cookies",
				Activated = function()
					print("Cookies!")
				end,
			},
		},
	}
end)
