import '../types/coordinate.dart';

class CoordinateHelper {
  static int _maximumRange = 2;
  static List<Coordinate> _neighbourOffsets = getNeighbourOffsets();

  static Iterable<Coordinate> getCoordinatesInRange(int range) {
    var coordinates = <Coordinate>[];
    for (var x = -range; x <= range; x++) {
      for (var y = -range; y <= range; y++) {
        var coordinate = Coordinate(x, y);
        if (_exists(coordinate)) coordinates.add(coordinate);
      }
    }

    return coordinates;
  }

  static Iterable<Coordinate> getNeighbourOffsets() {
    final offsets = <Coordinate>[];
    final coordinates = getCoordinatesInRange(1);
    for (final coordinate in coordinates) {
      if (coordinate.x != coordinate.y) if (_exists(coordinate)) offsets.add(coordinate);
    }

    return offsets;
  }

  static List<Coordinate> getNeighbours(Coordinate coordinate) {
    var coordinates = <Coordinate>[];
    for (final o in _neighbourOffsets) {
      var potentialNeighbour = Coordinate(coordinate.x + o.x, coordinate.y + o.y);
      if (_exists(potentialNeighbour)) coordinates.add(potentialNeighbour);
    }

    return coordinates;
  }

  static bool _exists(Coordinate coordinate) {
    if (coordinate.x < -_maximumRange || coordinate.x > _maximumRange) return false;
    if (coordinate.y < -_maximumRange || coordinate.y > _maximumRange) return false;

    if (coordinate.x == 1 && coordinate.y == 2) return false;
    if (coordinate.x == 2 && coordinate.y == 1) return false;
    if (coordinate.x == 2 && coordinate.y == 2) return false;

    if (coordinate.x == -1 && coordinate.y == -2) return false;
    if (coordinate.x == -2 && coordinate.y == -1) return false;
    if (coordinate.x == -2 && coordinate.y == -2) return false;

    return true;
  }
}
