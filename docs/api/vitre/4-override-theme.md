# :overrideTheme()

Overrides the default theme with a custom one.

```luau
function Vitre:overrideTheme(newTheme: Theme)
```

### Arguments
- **newTheme**: New theme to use.

### Types
- **Theme**:
```luau
type Theme = {
	Color: {
		Header: Color3,
		WidgetContainer: Color3,
		Stroke: Color3,
		Text: Color3,
		PlaceholderText: Color3,
		Widget: Color3,
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
```
