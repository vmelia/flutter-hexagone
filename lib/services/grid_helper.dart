import 'dart:math';

class GridHelper {
  final int _range = 2;
  List<Point<int>> _neighbourOffsets;

  GridHelper() {
    _neighbourOffsets = getNeighbourOffsets();
  }

  List<Point<int>> getCellsInRange(int range) {
    var cells = List<Point<int>>();
    for (var x = -range; x <= range; x++) {
      for (var y = -range; y <= range; y++) {
        var cell = Point<int>(x, y);
        if (_exists(cell)) cells.add(cell);
      }
    }

    return cells;
  }

  List<Point<int>> getNeighbourOffsets() {
    final offsets = List<Point<int>>();
    final cells = getCellsInRange(1);
    for (final cell in cells) {
      if (cell.x != cell.y) if (_exists(cell)) offsets.add(cell);
    }

    return offsets;
  }

  List<Point<int>> getNeighbours(Point<int> cell) {
    var cells = List<Point<int>>();
    for (final o in _neighbourOffsets) {
      var potentialNeighbour = Point<int>(cell.x + o.x, cell.y + o.y);
      if (_exists(potentialNeighbour)) cells.add(potentialNeighbour);
    }

    return cells;
  }

  bool _exists(Point<int> cell) {
    if (cell.x < -_range || cell.x > _range) return false;
    if (cell.y < -_range || cell.y > _range) return false;

    if (cell.x == 1 && cell.y == 2) return false;
    if (cell.x == 2 && cell.y == 1) return false;
    if (cell.x == 2 && cell.y == 2) return false;

    if (cell.x == -1 && cell.y == -2) return false;
    if (cell.x == -2 && cell.y == -1) return false;
    if (cell.x == -2 && cell.y == -2) return false;

    return true;
  }
}
