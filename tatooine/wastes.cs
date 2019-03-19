using System;
using TerrainGenCore;

/// <summary>
/// Stores a collection of methods to generate terrain
/// </summary>
[TerrainProvider]
class TerrainGenerator
{
    /// <summary>
    /// Returns the height of the terrain at a given point
    /// </summary>
    /// <param name="x">The x coordiate of the point to sample</param>
    /// <param name="z">The z coordiate of the point to sample</param>
    /// <returns>A height between 0 and 255, inclusive</returns>
    public double GetTerrain(double x, double z)
    {
        var j = ProcNoise.OctaveNoise(x / 110, z / 110, 4);
		
		// the first 2 values essentially translate to the radius of the creaters, smaller the number the bigger the creater
		var h = ProcNoise.Worley(x / 400, z / 400, j) * 1.45;
		if (h < 1)
			h = Circularize(h);
		else
			h = 1;
		
        return h * 100 + ProcNoise.OctaveNoise(x / 70, z / 70, 5) * 40;
    }
	
	private double Circularize(double x)
	{
		return 1 - Math.Sqrt(1 - Math.Pow(x, 1.8));
	}

    /// <summary>
    /// Gets the water level for the entire terrain
    /// </summary>
    /// <returns>A number between 0 and 255, inclusive</returns>
    public int GetWaterLevel()
    {
        return 0;
    }
}