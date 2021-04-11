import '../types/colour.dart';
import '../types/coordinate.dart';
import '../types/grid.dart';
import 'coordinate_helper.dart';

class GridHelper {
  static int _maximumRange = 2;
  static List<Coordinate> _allCoordinates = CoordinateHelper.getCoordinatesInRange(_maximumRange);

  static Grid createEmptyGrid() {
    var grid = Grid();
    for (final coordinate in _allCoordinates) {
      grid[coordinate] = Colour.White;
    }

    return grid;
  }

  static Grid getNeighbours(Grid grid, Coordinate coordinate) {
    var newGrid = Grid();
    var neighbouringCoordinates = CoordinateHelper.getNeighbours(coordinate);

    for (final neighbouringCoordinate in neighbouringCoordinates) {
      newGrid[neighbouringCoordinate] = grid[neighbouringCoordinate];
    }

    return newGrid;
  }
}