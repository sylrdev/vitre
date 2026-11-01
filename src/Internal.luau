const UserInputService = game:GetService("UserInputService")

const LemonSignal = require("../LemonSignal")
const Vide = require("../Vide")
const Types = require("./Types")

const source = Vide.source

type DragSignal = LemonSignal.Signal<Types.Window>

return {
	UserInput = UserInputService,
	PointerPosition = source(Vector2.zero),
	StartDrag = LemonSignal.new() :: DragSignal,
	StopDrag = LemonSignal.new() :: DragSignal,
}
