-- Controls the Y at which water starts
waterLevel = 0

function circularize(x)
	return 1 - math.sqrt(1 - math.pow(x, 1.8))
end

function terrain(x, z)
  local j = octNoise(x / 110, z / 110, 4)

  -- the first 2 values essentially translate to the radius of the creaters, smaller the number the bigger the creater
	local h = worley3(x / 400, z / 400, j) * 1.45
	if (h < 1) then
		h = circularize(h)
	else
		h = 1
	end

  -- the value multplying h defines the height of the canyons
	return h * 100 + octNoise(x / 70, z / 70, 5) * 40
end

function tree(x, y, z)
	return TREE_NONE
end