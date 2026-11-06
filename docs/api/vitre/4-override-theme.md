# :overrideTheme()

Overrides the default theme with a custom one. Missing keys from the custom theme will get filled with defaults.

```luau
function Vitre:overrideTheme(theme: CustomTheme)
```

### Arguments
- **newTheme**: New theme to use.

### Types
- **Theme**:
```luau
export type CustomTheme = {
	Color: {
		Header: Color3?,
		WidgetContainer: Color3?,
		Stroke: Color3?,
		Text: Color3?,
		PlaceholderText: Color3?,
		Widget: Color3?,
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
```
