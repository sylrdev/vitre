local Players = game:GetService("Players")

local App = require("@self/App")
local Internal = require("@self/Internal")
local Window = require("@self/Window")
local Vide = require("./Vide")

local mount = Vide.mount

local Vitre = {}

Vitre.Window = Window

Vitre.Internal = Internal

Vitre.setup = function()
	mount(App, Players.LocalPlayer.PlayerGui)

	print("Mounted.")
end

return Vitre
