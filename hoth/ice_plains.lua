waterLevel = 60

function terrain(x, z)
	local h = noise(x / 400, z / 400)
	local g = h / octNoise(x / 60, z / 60, 5) + 6
	local j = g * octNoise(x / 440, z / 440, 3)

	return j * 20
end

function tree(x, y, z)
	return TREE_NONE
end
