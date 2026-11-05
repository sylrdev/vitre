const Vitre = require("@game/ReplicatedStorage/Packages/Vitre")

Vitre:setup()
Vitre:append(function()
	local cookies = Vitre.Vide.source(0)

	return Vitre.Window {
		Title = "My Cool Window",
		Children = {
			Vitre.Widget.Text {
				Text = function()
					return string.format("Cookies: %i", cookies())
				end,
			},

			Vitre.Widget.Button {
				Text = "Get Cookies",
				Activated = function()
					cookies(cookies() + 1)
				end,
			},
		},
	}
end)
