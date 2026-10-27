local Players = game:GetService("Players")

local Internal = require("@self/Internal")
local Button = require("@self/Widgets/Button")
local CheckBox = require("@self/Widgets/CheckBox")
local Divider = require("@self/Widgets/Divider")
local DividerText = require("@self/Widgets/DividerText")
local Indent = require("@self/Widgets/Indent")
local SameLine = require("@self/Widgets/SameLine")
local Text = require("@self/Widgets/Text")
local TextBox = require("@self/Widgets/TextBox")
local Window = require("@self/Window")
local Vide = require("./Vide")

local mount = Vide.mount
local create = Vide.create
local action = Vide.action

local Vitre = {}
type Vitre = typeof(Vitre)

Vitre.Window = Window

Vitre.Widget = {
	Divider = Divider,
	Indent = Indent,
	SameLine = SameLine,

	Text = Text,
	DividerText = DividerText,
	TextBox = TextBox,

	Button = Button,
	CheckBox = CheckBox,
}

--- Sets up Vitre.
function Vitre.setup(self: Vitre)
	local mountPoint = Players.LocalPlayer.PlayerGui

	mount(function()
		--selene:allow(mixed_table)
		return create("ScreenGui") {
			Name = "Vitre",

			create("Frame") {
				Name = "WindowContainer",
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,

				action(function(instance)
					self:setWindowContainer(instance :: Frame)
				end),
			},
		}
	end, mountPoint)
end

--- Sets the UserInputService used internally to use a custom one.
--- Useful when using plugins like `UILabs`.
---
--- @param service UserInputService --- custom service to use
function Vitre:setUserInputService(service: UserInputService)
	Internal.UserInputService = service
end

--- Sets the container windows get rendered in.
--- Useful when using plugins like `UILabs`.
---
--- @param guiObject GuiObject --- new container to render windows in
function Vitre:setWindowContainer(guiObject: GuiObject)
	Internal.WindowContainer(guiObject)
end

return Vitre
