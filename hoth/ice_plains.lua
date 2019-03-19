waterLevel = 60

function terrain(x, z)
	-- the first 2 values affect the density of terrain of the higher areas, the higher the number the more dense the peaks will be
	local h = noise(x / 40, z / 40)
	-- the final added value translates the terrain upwards, this is where you can control the water level ratio
	--  the first 2 values define the smoothness of the peak areas.  The higher the number the smoother and wider they become
	-- the octave affects the tightness and roughness of the density of peaks, lower values make the terrain much more cartoony and rounded
	local g = h / octNoise(x / 60, z / 60, 5) + 6

	-- the first 2 values affect the distribution of the terrain, the lower the value the smaller the islands and the tighter together they are
	--  the octave affects the ratio of landmass to water, it doesn't make them tighter like the noise values, but actually takes the same terrain and changes how much of it is present vs water.  Higher values mean more land and less water
	local j = g * octNoise(x / 440, z / 440, 3)

	-- the multiplied value affects the difference in height between the high and low areas, the higher the number, the more everythint tends to the world height
	return j * 20
end

function tree(x, y, z)
	return TREE_NONE
end
