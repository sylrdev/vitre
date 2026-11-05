# :overrideUserInput()

Overrides the default user input service to use a custom one.

::: note
Call this when rendering a window in a storybook plugin like UI Labs.
:::

```luau
function Vitre:overrideUserInput(uis: UserInputService)
```

### Arguments
- **uis**: New user input service to use.
