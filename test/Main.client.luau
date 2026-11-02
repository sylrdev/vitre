const Vide = require("@game/ReplicatedStorage/Packages/Vide")
const Vitre = require("@game/ReplicatedStorage/Packages/Vitre")

const source = Vide.source

Vitre:setup()

Vitre.Window { Visible = source(false) }
Vitre.Window {}
