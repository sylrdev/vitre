const Players = game:GetService("Players")
const RunService = game:GetService("RunService")

const Internal = require("@self/Internal")
const Theme = require("@self/Theme")
const Types = require("@self/Types")
const Button = require("@self/Widgets/Button")
const Checkbox = require("@self/Widgets/Checkbox")
const Divider = require("@self/Widgets/Divider")
const DividerText = require("@self/Widgets/DividerText")
const Indent = require("@self/Widgets/Indent")
const RadioButton = require("@self/Widgets/RadioButton")
const SameLine = require("@self/Widgets/SameLine")
const Text = require("@self/Widgets/Text")
const TextBox = require("@self/Widgets/TextBox")
const Window = require("@self/Window")
const Vide = require("./Vide")

const mount = Vide.mount
const create = Vide.create
const source = Vide.source
const indexes = Vide.indexes
const action = Vide.action

const IS_STORY = RunService:IsStudio() == true and RunService:IsRunning() == false

local windows = source {}
local windowContainerRef: Frame

const Vitre = {}
Vitre.Widget = {
	Text = Text,
	DividerText = DividerText,
	TextBox = TextBox,

	Divider = Divider,
	Indent = Indent,
	SameLine = SameLine,

	Button = Button,
	Checkbox = Checkbox,
	RadioButton = RadioButton,
}

Vitre.Vide = Vide

--[[
	Sets up the app to render windows in while emulating.

	Note: Does not work in a story environment.
]]
function Vitre:setup()
	if IS_STORY == true then
		error("Cannot setup Vitre in a story environment.")
	end

	const mountTarget = Players.LocalPlayer.PlayerGui

	mount(function()
		--selene:allow(mixed_table)
		return create("ScreenGui") {
			Name = "VitreApp",

			create("Frame") {
				Name = "WindowContainer",
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,

				action(function(instance)
					windowContainerRef = instance :: Frame
				end),
			},
		}
	end, mountTarget)
end

--[[
	Creates a window component.

	WARNING: Broken function. Use `Vitre.WindowRaw()` instead.

	@param props: WindowProps - Properties to apply to the window component
	@return any? - Created window when in a story environment, nil otherwise
]]
function Vitre.Window(props: () -> Types.WindowProps): any?
	warn("Vitre.Window() is broken and doesn't behave the way it is intended to.")

	if IS_STORY == true then
		return Window(props())
	else
		return Vide.mount(function()
			return Window(props())
		end, windowContainerRef)
	end
end

--[[
	Creates a window raw component.

	Note: Useful if you want to render the window in something other than the default App. (ex: plugin widget)

	@param props: WindowProps - Properties to apply to the window component
]]
function Vitre.WindowRaw(props: Types.WindowProps)
	return Window(props)
end

--[[
	Overrides the default user input service to use a custom one.

	Note: Call this when rendering a window in a storybook plugin like UI Labs.

	@param uis: UserInputService - New user input service to use.
]]
function Vitre:overrideUserInput(uis: UserInputService)
	Internal.UserInput = uis
end

--[[
	Overrides the default theme with a custom one.

	@param newTheme: Theme - New theme to use.
]]
function Vitre:overrideTheme(newTheme: Types.Theme)
	Theme(newTheme)
end

return Vitre
