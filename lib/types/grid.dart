import 'colour.dart';
import 'coordinate.dart';

class Grid {
  Map<Coordinate, Colour> _cells = Map<Coordinate, Colour>();

  Grid();
  Grid.copy(Grid grid) {
    for (final key in _cells.keys) {
      this[key] = grid[key];
    }
  }

  operator [](Coordinate coordinate) => _cells[coordinate];

  operator []=(coordinate, colour) {
    _cells[coordinate] = colour;
  }

  Iterable<Coordinate> get coordinates => _cells.keys;

  int get count => _cells.length;

  bool contains(Coordinate coordinate) => _cells.containsKey(coordinate);

  bool isAllwhite() => !_cells.values.any((x) => x != Colour.White);
}
