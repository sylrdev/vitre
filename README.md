# Vitre

[Documentation](https://sylrdev.github.io/vitre)

## What's Vitre?

Vitre is a developer focused reactive UI library. It is based on centau's work: [Vide](https://centau.github.io/vide/). The aesthetic is inspired by [Iris](https://sirmallard.github.io/Iris/) and [ImGUI](https://github.com/ocornut/imgui).

If you have experience with Vide or reactive UI frameworks in general, most of their concepts can carry over to Vitre.

If you don't, it is recommended that you take a glance at the [Vide documentation](https://centau.github.io/vide/) to develop an understanding of its core concepts.

---

The problems Vitre aims to solve are the following:
- Quick and easy to deploy so you can focus on testing your systems and not rely on messy prints
- Make projects that already use Vide able to use it for their dev tools
- Strictly typed and new solver friendly code

## Installation

Vitre is published under the [Wally](https://wally.run/package/sylrdev/vitre?version=0.2.0) package repository, making it able to be downloaded by any Roblox package manager.

### [Wally](https://wally.run/)

Add the following to your `wally.toml` file and run `wally install` in your console.

```toml
[Packages]
Vitre = "sylrdev/vitre@0.2.3"
```

### [Pesde](https://pesde.dev/)

Run the following in your console.

```sh
pesde add wally#sylrdev/vitre
```

### [Forest](https://forest.dev/)

Run the following in your console.

```sh
forest i sylrdev/vitre
```

### [Ember](https://emberpm.dev/)

Run the following in your console.

```sh
embr add sylrdev/vitre --index wally
```

### [Crater](https://registry.crater-dev.workers.dev/)

Run the following in your console.

```sh
crater add wally#sylrdev/vitre@0.2.3
```

## TODO
- typescript definitions + publish under @rbxts
- widgets
    - tree
    - table
    - graphs? (maybe with an addon)
    - extra props
- dont drag window when in collapse button
- make windows able to render in widget docks
- documentation widget examples

## Credits
- [Vide](https://github.com/centau/vide) for providing the framework Vitre is based on
- [Iris](https://github.com/SirMallard/Iris) for being a pillar in the creation of this resource
- [ui-labs](https://github.com/PepeElToro41/ui-labs) for making such a great storybook plugin
- The [Replecs Docs](https://pepeeltoro41.github.io/replecs/) of which I followed the API reference writting style
