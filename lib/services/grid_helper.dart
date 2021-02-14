import 'package:hexagone/contracts/i_coordinate_helper.dart';
import 'package:hexagone/contracts/i_grid_helper.dart';
import 'package:hexagone/types/colour.dart';
import 'package:hexagone/types/coordinate.dart';
import '../locator.dart';

class GridHelper implements IGridHelper {
  final int _maximumRange = 2;
  ICoordinateHelper _coordinateHelper;
  List<Coordinate> _allCoordinates;

  GridHelper() {
    _coordinateHelper = locator<ICoordinateHelper>();
    _allCoordinates = _coordinateHelper.getCoordinatesInRange(_maximumRange);
  }

  Map<Coordinate, Colour> createGrid() {
    var grid = Map<Coordinate, Colour>();
    for (final coordinate in _allCoordinates) {
      grid[coordinate] = Colour.White;
    }

    return grid;
  }

  Map<Coordinate, Colour> getNeighbours(
      Map<Coordinate, Colour> grid, Coordinate coordinate) {
    var newGrid = Map<Coordinate, Colour>();
    var neighbouringCoordinates = _coordinateHelper.getNeighbours(coordinate);

    for (final neighbouringCoordinate in neighbouringCoordinates) {
      newGrid[neighbouringCoordinate] = grid[neighbouringCoordinate];
    }  

    return newGrid;
  }
}
