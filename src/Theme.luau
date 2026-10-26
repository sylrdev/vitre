local Tailwind = require("../Tailwind")

local Theme = {
	COLOR = {
		HEADER = Tailwind.blue[500],
		WINDOW_BACKGROUND = Tailwind.neutral[900],
		STROKE = Tailwind.neutral[400],
		TEXT = Tailwind.neutral[200],
	},

	FONT = {
		HEADER = Font.fromId(16658246179, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
		CONTENT = Font.fromId(16658246179, Enum.FontWeight.Regular, Enum.FontStyle.Normal),
	},

	STROKE_THICKNESS = 2,

	WINDOW_CHILDREN_PADDING = 10,
}

return Theme
