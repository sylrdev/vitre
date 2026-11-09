# Reactive Window

The window we previously made is purely static, nothing gets updated. How about we change that?

That cookie button is sweet but it would be nice if we could see how many cookies we got so far.

## Step 1: The Source

First of all, we need a way to store our cookies. A regular variable won't cut it because it won't reload the UI every time that value is incremented.

That's where `Vide.source()` comes in clutch. Every time a source gets updated, any UI component connected to it will automatically get updated with the new value the source holds.

```luau
-- MyWindow.luau
const Vitre = require(path.to.Vitre)
const Vide = Vitre.Vide -- or require(path.to.Vide)

const source = Vide.source

return function()
    -- we initialize the cookies source with 0 since we start with zero cookies
    local cookies = source(0)

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

## Step 2: Displaying

### Adding the Widget

Making a source is good and all but we need a way to see it in the UI.

While making our first window, we used a button widget. Remember that `Vitre.Widget` holds every built-in window widgets? We can use that information to add a text widget to our window.


```luau
return Vitre.Window {
    Title = "My Cool Window",
    Children = {
        Vitre.Widget.Text {}, -- add this

        Vitre.Widget.Button {
            Text = "Get Cookies",
            Activated = function()
                print("Cookies!")
            end
        },
    },
}
```

### Formatting the Text

Cookie source, check. Text widget, check. But we still can't see the source's value.

To achieve that, we need to make the text widget use the `cookies` source.

```luau
Vitre.Widget.Text {
    Text = function()
        -- I like string.format but interpolated strings also work
        return string.format("Cookies: %i", cookies())
    end
},
```

If you don't understand why the `Text` property of our text widget is a function, I recommend checking the [sources page](https://centau.github.io/vide/tut/crash-course/4-source.html) on the Vide docs.

And here we go, we now have text in our window, reading the content of the source.

<img src="/assets/6-reactive-window.png" width="400">

## Step 3: Incrementing

The last step is honestly the easiest. We need to add 1 cookie to the `cookies` source every time we click on the button.

Modify the `Activated` key of the button widget so it increments on every activation.

```luau
Vitre.Widget.Button {
    Text = "Get Cookies",
    Activated = function()
        -- we read cookies, add one and set cookies to that result
        cookies(cookies() + 1)
    end
},
```

Click a couple times on the button and your number of cookies should go up!

---

You now have all the keys in hand to start your development journey with Vitre. If you're confused about some concepts, it is recommended that you check out [Vide](https://centau.github.io/vide/).
