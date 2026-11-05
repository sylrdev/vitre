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
	Size: Types.Prop<Vector2>?,
	Title: Types.Prop<string>?,
	Visible: Vide.Source<boolean>?,
	CanCollapse: Types.Prop<boolean>?,
	CanDrag: Types.Prop<boolean>?,
	Children: { [any]: any }?,
}
```

- **Prop**: [API reference](/api/types/1-prop)
