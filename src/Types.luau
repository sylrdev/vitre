const Vide = require("../Vide")

export type Prop<T> = T | Vide.Source<T>

export type Window = Frame & { Header: Frame }

export type Theme = {
	Color: {
		Header: Color3,
		WidgetContainer: Color3,
		Stroke: Color3,
	},

	StrokeThickness: number,
}

return nil
