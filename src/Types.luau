const Vide = require("../Vide")

export type Prop<T> = T | Vide.Source<T>

export type Window = Frame & { Header: Frame }

export type Theme = {
	Color: {
		Header: Color3,
		WidgetContainer: Color3,
		Stroke: Color3,
		Text: Color3,
		PlaceholderText: Color3,
		WidgetLight: Color3,
		WidgetDark: Color3,
	},

	CornerRadius: number,

	Font: {
		Header: Font,
		Content: Font,
	},

	Padding: {
		WidgetContainer: number,
		Widget: number,
	},

	StrokeThickness: number,

	TextSize: number,
}

export type CustomTheme = {
	Color: {
		Header: Color3?,
		WidgetContainer: Color3?,
		Stroke: Color3?,
		Text: Color3?,
		PlaceholderText: Color3?,
		WidgetLight: Color3?,
		WidgetDark: Color3?,
	}?,

	CornerRadius: number?,

	Font: {
		Header: Font?,
		Content: Font?,
	}?,

	Padding: {
		WidgetContainer: number?,
		Widget: number?,
	}?,

	StrokeThickness: number?,

	TextSize: number?,
}

return nil
