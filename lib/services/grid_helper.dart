import 'package:hexagone/contracts/i_coordinate_helper.dart';
import 'package:hexagone/contracts/i_grid_helper.dart';
import 'package:hexagone/types/Colour.dart';
import 'package:hexagone/types/coordinate.dart';
import '../locator.dart';

class GridHelper implements IGridHelper {
  final coordinateHelper = locator<ICoordinateHelper>();
  final int _maximumRange = 2;
  List<Coordinate> _allCoordinates;

  GridHelper() {
    _allCoordinates = coordinateHelper.getCoordinatesInRange(_maximumRange);
  }

  Map<Coordinate, Colour> createGrid() {
    var map = Map<Coordinate, Colour>();
    for (final coordinate in _allCoordinates) {
      map[coordinate] = Colour.White;
    }

    return map;
  }
}
