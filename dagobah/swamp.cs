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
    // the first 2 values affect the density of terrain of the higher areas, the higher the number the more dense the peaks will be
    var h = ProcNoise.OctaveNoise(x / 80, z / 80, 5) + 5;

    var g = ProcNoise.OctaveWorley(h / 1.6, 2000, 3);

    return g * 200;
  }
  public int GetWaterLevel()
  {
    return 60;
  }
}