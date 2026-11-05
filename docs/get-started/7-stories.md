# Stories

Storybook plugins play a big part in reactive UI development. Vitre was even developed using [UI Labs](https://ui-labs.luau.page/).

::: warning
Vitre was not tested on storybook plugins other than UI Labs. So if you use Hoarcekat or Flipbook, there may be dragons.
It is recommended that you migrate to the industry standard for a guaranteed working experience of Vitre.
:::

---

Since Vitre is natively compatible with UI Labs, we'll use that plugin.

Let's take the window we created in ["Your First Window"](/get-started/5-your-first-window) tutorial.

```luau
-- MyWindow.luau
const Vitre = require(path.to.Vitre)

return function()
    return Vitre.Window {
        Title = "My Cool Window",
        Children = {
            Vitre.Widget.Button {
                Text = "Get Cookies",
                Activated = function()
                    print("Cookies!")
                end
            },
        },
    }
end
```

To render it in a UI Labs story we just need to do the following:

```luau
const MyWindow = require(path.to.MyWindow)
const Vitre = require(path.to.Vitre)
const Vide = Vitre.Vide -- or require(path.to.Vide)
const UILabs = require(path.to.UILabs)

return {
    vide = Vide,
    story = function()
        Vitre:overrideUserInput(UILabs.Environment.UserInput)

        return MyWindow()
    end
}
```

::: tip
It's also possible to use UI Labs' story builder.
:::

---

The key part is `Vitre:overrideUserInput()`.
Without overriding the native roblox `UserInputService`, we would not be able to drag the window in a plugin dock such as UI Labs.

While the dragging will still work as intended when emulating, if you aren't able to drag the window in a widget dock, it's probably because you forgot to call that method.
