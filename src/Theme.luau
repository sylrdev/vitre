const Tailwind = require("../Tailwind")
const Vide = require("../Vide")
const Types = require("./Types")

const source = Vide.source

local Theme: Types.Theme = {
	Color = {
		Header = Tailwind.blue[500],
		WidgetContainer = Tailwind.neutral[800],
		Stroke = Tailwind.neutral[400],
		Text = Tailwind.neutral[200],
	},

	CornerRadius = 2,

	StrokeThickness = 2,

	TextSize = 15,

	Font = {
		Header = Font.fromId(16658246179, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
		Content = Font.fromId(16658246179, Enum.FontWeight.Medium, Enum.FontStyle.Normal),
	},
}

return source(Theme)
