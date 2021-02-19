import 'package:hexagone/contracts/i_coordinate_helper.dart';
import 'package:hexagone/contracts/i_grid_helper.dart';
import 'package:hexagone/types/colour.dart';
import 'package:hexagone/types/coordinate.dart';
import 'package:hexagone/types/grid.dart';
import '../locator.dart';

class GridHelper implements IGridHelper {
  final int _maximumRange = 2;
  ICoordinateHelper _coordinateHelper;
  List<Coordinate> _allCoordinates;

  GridHelper() {
    _coordinateHelper = locator<ICoordinateHelper>();
    _allCoordinates = _coordinateHelper.getCoordinatesInRange(_maximumRange);
  }

  Grid createGrid() {
    var grid = Grid();
    for (final coordinate in _allCoordinates) {
      grid[coordinate] = Colour.White;
    }

    return grid;
  }

  Grid copyGrid(Grid grid) {
    var newGrid = Grid();
    for (final key in grid.keys) {
      newGrid[key] = grid[key];
    }

    return newGrid;
  }

  Grid getNeighbours(Grid grid, Coordinate coordinate) {
    var newGrid = Grid();
    var neighbouringCoordinates = _coordinateHelper.getNeighbours(coordinate);

    for (final neighbouringCoordinate in neighbouringCoordinates) {
      newGrid[neighbouringCoordinate] = grid[neighbouringCoordinate];
    }

    return newGrid;
  }

  bool isAllwhite(Grid grid) => !grid.values.any((x) => x != Colour.White);
}
