local UILabs = require("../DevPackages/UILabs")
local Vide = require("../Packages/Vide")
local Vitre = require("../Packages/Vitre")

return {
	vide = Vide,
	story = function(props: UILabs.VideProps)
		Vitre.Internal.UserInputService = UILabs.Environment.UserInput
		Vitre.Internal.Parent(props.target)

		return Vitre.Window {}
	end,
}
