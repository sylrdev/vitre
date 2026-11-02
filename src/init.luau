const Players = game:GetService("Players")
const RunService = game:GetService("RunService")

const Internal = require("@self/Internal")
const Types = require("@self/Types")
const Window = require("@self/Window")
const Vide = require("./Vide")

const mount = Vide.mount
const create = Vide.create
const source = Vide.source
const indexes = Vide.indexes

local windows = source {}

const Vitre = {}

type WindowProps = {
	Size: Types.Prop<Vector2>?,
}

function Vitre.setup()
	local mountTarget = Players.LocalPlayer.PlayerGui

	mount(function()
		--selene:allow(mixed_table)
		return create("ScreenGui") {
			Name = "VitreApp",

			create("Frame") {
				Name = "WindowContainer",
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,

				indexes(windows, function(prop: () -> WindowProps)
					return Window(prop())
				end),
			},
		}
	end, mountTarget)
end

function Vitre.Window(props: WindowProps): Frame?
	if RunService:IsStudio() == true and RunService:IsRunning() == false then
		return Window(props)
	else
		local clone = table.clone(windows())
		table.insert(clone, props)
		windows(clone)

		return nil
	end
end

--[[
	Overrides the default user input service to use a custom one.

	Note: Call this when rendering a window in a storybook plugin like UI Labs.

	@param uis: UserInputService - New user input service to use.
]]
function Vitre:overrideUserInput(uis: UserInputService)
	Internal.UserInput = uis
end

return Vitre
