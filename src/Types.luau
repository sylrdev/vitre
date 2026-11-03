const Vide = require("../Vide")

export type Prop<T> = T | Vide.Source<T>

export type Window = Frame & { Header: Frame }

export type WindowProps = {
	Size: Prop<Vector2>?,
	Title: Prop<string>?,
	Visible: Vide.Source<boolean>?,
	CanCollapse: Prop<boolean>?,
	CanDrag: Prop<boolean>?,
	Children: { [any]: any }?,
}

export type Theme = {
	Color: {
		Header: Color3,
		WidgetContainer: Color3,
		Stroke: Color3,
		Text: Color3,
	},

	CornerRadius: number,

	StrokeThickness: number,

	TextSize: number,

	Font: {
		Header: Font,
		Content: Font,
	},
}

return nil
