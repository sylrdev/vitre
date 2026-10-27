local Vide = require("@game/ReplicatedStorage/Packages/Vide")
local Vitre = require("@game/ReplicatedStorage/Packages/Vitre")

Vitre:setup()

Vide.root(function()
	return {
		Vitre.Window {},
		Vitre.Window {},
		Vitre.Window {},
		Vitre.Window {},
	}
end)
