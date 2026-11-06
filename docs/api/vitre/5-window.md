# .Window()

Returns a window Vide component.

```luau
function Vitre.Window(props: Props)
```

### Arguments
- **props**: Properties to apply to the window.

### Types
- **Props**:
```luau
type Props = {
	Size: Prop<Vector2>?,
	Title: Prop<string>?,
	Visible: Vide.Source<boolean>?,
	CanCollapse: Prop<boolean>?,
	CanDrag: Prop<boolean>?,
	NoHeader: Prop<boolean>?,
	Children: { [any]: any }?,
}
```

- **Prop**: [API reference](/api/types/1-prop)
