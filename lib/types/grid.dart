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

  Map<Coordinate, Colour> get cells => _cells;

  operator [](Coordinate coordinate) => _cells[coordinate];

  operator []=(coordinate, colour) {
    _cells[coordinate] = colour;
  }

  bool isAllwhite() => !_cells.values.any((x) => x != Colour.White);
}
