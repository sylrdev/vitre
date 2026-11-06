const Players = game:GetService("Players")
const RunService = game:GetService("RunService")

const DeepCopy = require("@self/DeepCopy")
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
const action = Vide.action

const IS_STORY = RunService:IsStudio() == true and RunService:IsRunning() == false

local windowContainerRef: Frame

const Vitre = {
	Window = Window,

	Widget = {
		Text = Text,
		DividerText = DividerText,
		TextBox = TextBox,

		Divider = Divider,
		Indent = Indent,
		SameLine = SameLine,

		Button = Button,
		Checkbox = Checkbox,
		RadioButton = RadioButton,
	},

	Vide = Vide,
}

export type Prop<T> = Types.Prop<T>

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
	Adds a component to render in the Vitre app.

	@param component: () -> any - Component to render.
]]
function Vitre:append(component: () -> any)
	mount(component, windowContainerRef)
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
function Vitre:overrideTheme(theme: Types.CustomTheme)
	local newTheme = DeepCopy(Theme()) :: { [string]: any | { [string]: any } }

	for key, value in pairs(theme :: { [string]: any | { [string]: any } }) do
		if type(value) == "table" then
			for nestedKey, nestedValue in pairs(value) do
				newTheme[key][nestedKey] = nestedValue
			end
		else
			newTheme[key] = value
		end
	end

	Theme(newTheme)
end

return Vitre
