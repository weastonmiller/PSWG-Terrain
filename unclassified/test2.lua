-- Controls the Y at which water starts
waterLevel = 60

-- This is the main method that gets called to
-- find the height of the terrain at each point.
function terrain(x, z)

	-- First, we sample the noise with a scale factor of 100.
	-- The global function `noise` returns a sampled Simplex
	-- heightmap with values between 0 and 1.
	local h = noise(x / 80, z / 80);
  local g = h / octNoise(x / 60,z / 60,5) + 5;

	-- Then, we scale the resulting noise by 10, creating a
	-- maximum elevation change of 10 blocks, and return it
  -- back to the terrain generator.
  if (g * 10 < waterLevel) then
    return math.pow(g * 10, 1.1)
  end

	return g * 10
end

-- This function determines if a tree should be
-- present at the current (x, y, z) during the
-- decoration phase. Return `TREE_NONE` if no tree
-- should be present. Otherwise, return the tree
-- type ID (i.e. `TREE_MC`)
function tree(x, y, z)
	return TREE_NONE
end

-- noise(x,z)
-- rawnoise(x,z)

-- noise3(x,y,z)
-- rawnoise3(x,y,z)

-- noise4(x,y,z,w)
-- rawnoise4(x,y,z,w)

-- worley(x,z)
-- rawworley(x,z)

-- worley3(x,y,z)
-- rawworley3(x,y,z)

-- noiseDx(x,z)
-- noiseDz(x,z)

-- octNoise(x,z,octaves)
-- octWorley(x,z,octaves)
-- octInvWorley(x,z,octaves)

-- hashA(x,z)
-- hashB(x,z)