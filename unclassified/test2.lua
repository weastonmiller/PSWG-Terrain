waterLevel = 60

function terrain(x, z)
	local h = noise(x / 80, z / 80)
	local g = h / octNoise(x / 60, z / 60, 5) + 5

	if (g * 10 < waterLevel) then
		return math.pow(g * 10, 1.1)
	end

	return g * 10
end

function tree(x, y, z)
	return TREE_NONE
end
