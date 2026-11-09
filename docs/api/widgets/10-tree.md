# .Widget.Tree()

Returns a tree widget Vide component.

<img src="/assets/10-tree.png" width="400">

```luau
function(props: Props)
```

### Arguments
- **props**: Properties to apply to the tree.

### Types
- **Props**:
```luau
type Props = {
	Text: Prop<string>?,
	Collapsed: boolean?,
	IsTitle: Prop<boolean>?,
	Children: { [any]: any },
}
```

- **Prop**: [API reference](/api/types/1-prop)
