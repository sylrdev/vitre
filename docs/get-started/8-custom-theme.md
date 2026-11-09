# Custom Theme

Making a custom theme that fits your desire is very easy in Vitre. If you're using v0.3 or newer, you only need to override what you want to change.

By looking at the `:overrdeTheme()` [API reference](/api/vitre/4-override-theme), we can see the theme type that the function takes as parameter. Using that information we can now make our custom theme.

For this example, I'm going to change the window header's color, remove the corner radius and change the content font.

```luau
-- MyTheme.luau
const Vitre = require(path.to.Vitre)

local MyTheme: Vitre.CustomTheme = {
	Color = {
		Header = Color3.fromRGB(255, 100, 100),
	},

	Font = {
		Content = Font.fromName("LuckiestGuy", Enum.FontWeight.Regular, Enum.FontStyle.Italic),
	},

    CornerRadius = 0,
}

return MyTheme
```

We built our theme, now it's time to override the current theme with the one we just created. Any key that we haven't set a value for will get filled with defaults.

```luau
-- Main.client.luau
const Vitre = require(path.to.Vitre)
const MyTheme = require("@self/MyTheme")

Vitre:overrdeTheme(MyTheme)
```

And this should be the result!

<img src="/assets/8-custom-theme.png" width="400">
