# Vitre

## Why Vitre?
Vitre is a UI library aimed at developers. It follows the footsteps of ImGUI and Iris in terms of look but uses Vide to handle the rendering and reactiveness.
It is effectively immediate by looks but reactive under the hood.

Since Vitre is based on Vide, you can use the whole Vide API in your Vitre interfaces. You can even write custom widgets to fit your exact need if it's not built-in while keeping the same theming consistency.

## Installation
You can find Vitre on Wally so you can install that with your favorite package manager.
```toml
Vitre = "sylrdev/vitre@0.1.0"
```

## Setup
Vitre is very easy to set up, only requiring the call of a single method to properly set up the entired environment and start building windows as fast as possible.

### Default
```luau
const Vitre = require("path.to.Vitre")

Vitre:setup()
```

What's `:setup()`? All it does is setup an app to render windows in.
That's it, you can now create you first window.

### Stories
Rendering Vitre windows in storybook plugins has only been tested and developed with UILabs, so if you use any other storybook plugin, some features might be broken.

```luau
const Vitre = require("path.to.Vitre")
const Vide = Vitre.Vide -- Vitre provides vide if you don't use that framework.
const UILabs = require("path.to.UILabs")

return {
    vide = Vide,
    story = function()
        Vitre:overrideUserInput(UILabs.Environment.UserInput) -- the important part

        return Vitre.Window {
            Children = {
                Vitre.Widget.Text {
                    Text = "Hello World!",
                },

                Vitre.Widget.Button {
                    Text = "Click Me!",
                    Activated = function()
                        print("Hello World!")
                    end,
                },
            },
        }
    end
}
```

No need to call `:setup()`.
The important part is overriding the UserInput with `:overrideUserInput()`. Without that, dragging windows rendered in a storybook plugin widget dock would not work.

## API
The API is incomplete, will be complete when I write proper docs on GitHub pages.

### Widgets
All of the widgets can be found under `Vitre.Widget`. They are Vide components so they work just like Vide components are supposed to work.

## TODO
- header toggle
- fix `Vitre.Window()`
- widgets
    - tree
    - table
    - graphs? (maybe with an addon)
- dont drag window when in collapse button
- proper documentation
