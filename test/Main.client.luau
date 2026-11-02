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
-- 		Header = Tailwind.emerald[500],
-- 		WidgetContainer = Tailwind.neutral[600],
-- 		Stroke = Tailwind.neutral[400],
-- 		Text = Tailwind.neutral[200],
-- 	},
--
-- 	StrokeThickness = 2,
--
-- 	TextSize = 20,
--
-- 	Font = {
-- 		Header = Font.fromId(16658246179, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
-- 		Content = Font.fromId(16658246179, Enum.FontWeight.Medium, Enum.FontStyle.Normal),
-- 	},
-- }
