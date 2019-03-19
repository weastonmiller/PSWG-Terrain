waterLevel = 0

function circularize(x)
	return 1 - math.sqrt(1 - math.pow(x, 1.8))
end

function terrain(x, z)
	-- because of how this is used in the worley function later, the first 2 value of this noise affect how smooth the terrain outside of the main worley deformation is.  Larger numbers make it more rough
	local j = octNoise(x / 110, z / 110, 4)

	-- the first 2 values essentially translate to the radius of the creaters, smaller the number the bigger the creater
	-- the final multiplied value defines how much of the canyon deformation is allowed to happen across the entire surface area.  Higher numbers start to make the terrain tend to 0 and become flat with no canyon deformation
	local h = worley3(x / 400, z / 400, j) * 1.45
	if (h < 1) then
		h = circularize(h)
	else
		h = 1
	end

	-- the value multplying h defines the height of the canyons
	-- the first and second values define the roughness of the low valley terrain, the larger the number the more rough it is
	-- the final multiplied value "roughs up" the edges of the canyon deformation and the higher ridges and makes the terrain more naturally flowing
	return h * 100 + octNoise(x / 70, z / 70, 5) * 40
end

function tree(x, y, z)
	return TREE_NONE
end
