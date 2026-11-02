const Tailwind = require("@game/ReplicatedStorage/Packages/Tailwind")
const Vide = require("@game/ReplicatedStorage/Packages/Vide")
const Vitre = require("@game/ReplicatedStorage/Packages/Vitre")

const source = Vide.source

Vitre:setup()

Vitre.Window { Visible = source(false) }
Vitre.Window {}
Vitre.Window {}

-- Vitre:overrideTheme {
-- 	Color = {
-- 		Header = Tailwind.rose[500],
-- 		WidgetContainer = Tailwind.blue[800],
-- 		Stroke = Tailwind.neutral[400],
-- 	},
--
-- 	StrokeThickness = 2,
-- }
