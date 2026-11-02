const Tailwind = require("../Tailwind")
const Vide = require("../Vide")
const Types = require("./Types")

const source = Vide.source

local Theme: Types.Theme = {
	Color = {
		Header = Tailwind.blue[500],
		WidgetContainer = Tailwind.neutral[800],
		Stroke = Tailwind.neutral[400],
	},

	StrokeThickness = 2,
}

return source(Theme)
