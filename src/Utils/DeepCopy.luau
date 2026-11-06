local function DeepCopy<T>(tab: T & {}): T
	local clone = {}

	for key, value in pairs(tab) do
		if type(value) == "table" then
			clone[key] = DeepCopy(value)
		else
			clone[key] = value :: any
		end
	end

	return clone :: typeof(tab)
end

return DeepCopy
