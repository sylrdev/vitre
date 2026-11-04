const Vitre = require("@game/ReplicatedStorage/Packages/Vitre")

Vitre:setup()
Vitre.Window(function()
	return {
		Children = {
			Vitre.Widget.Text {
				Text = "Test",
			},
		},
	}
end)
