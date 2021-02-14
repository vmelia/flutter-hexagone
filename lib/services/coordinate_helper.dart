import 'package:hexagone/contracts/i_coordinate_helper.dart';
import 'package:hexagone/types/coordinate.dart';

class CoordinateHelper implements ICoordinateHelper {
  final int _maximumRange = 2;
  List<Coordinate> _neighbourOffsets;

  CoordinateHelper() {
    _neighbourOffsets = getNeighbourOffsets();
  }

  Iterable<Coordinate> getCoordinatesInRange(int range) {
    var coordinates = List<Coordinate>();
    for (var x = -range; x <= range; x++) {
      for (var y = -range; y <= range; y++) {
        var coordinate = Coordinate(x, y);
        if (_exists(coordinate)) coordinates.add(coordinate);
      }
    }

    return coordinates;
  }

  Iterable<Coordinate> getNeighbourOffsets() {
    final offsets = List<Coordinate>();
    final coordinates = getCoordinatesInRange(1);
    for (final coordinate in coordinates) {
      if (coordinate.x != coordinate.y) if (_exists(coordinate))
        offsets.add(coordinate);
    }

    return offsets;
  }

  List<Coordinate> getNeighbours(Coordinate coordinate) {
    var coordinates = List<Coordinate>();
    for (final o in _neighbourOffsets) {
      var potentialNeighbour =
          Coordinate(coordinate.x + o.x, coordinate.y + o.y);
      if (_exists(potentialNeighbour)) coordinates.add(potentialNeighbour);
    }

    return coordinates;
  }

  bool _exists(Coordinate coordinate) {
    if (coordinate.x < -_maximumRange || coordinate.x > _maximumRange)
      return false;
    if (coordinate.y < -_maximumRange || coordinate.y > _maximumRange)
      return false;

    if (coordinate.x == 1 && coordinate.y == 2) return false;
    if (coordinate.x == 2 && coordinate.y == 1) return false;
    if (coordinate.x == 2 && coordinate.y == 2) return false;

    if (coordinate.x == -1 && coordinate.y == -2) return false;
    if (coordinate.x == -2 && coordinate.y == -1) return false;
    if (coordinate.x == -2 && coordinate.y == -2) return false;

    return true;
  }
}
