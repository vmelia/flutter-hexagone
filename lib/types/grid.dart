import 'colour.dart';
import 'coordinate.dart';

class Grid {
  Map<Coordinate, Colour> _cells = Map<Coordinate, Colour>();

  Grid();
  
  Grid.copy(Grid grid) {
    for (final coordinate in grid.coordinates) {
      this[coordinate] = grid[coordinate];
    }
  }

  operator [](Coordinate coordinate) => _cells[coordinate];

  operator []=(coordinate, colour) {
    _cells[coordinate] = colour;
  }

  Iterable<Coordinate> get coordinates => _cells.keys;

  int get count => _cells.length;

  bool contains(Coordinate coordinate) => _cells.containsKey(coordinate);

  bool isAllwhite() => _cells.values.every((x) => x == Colour.White);
}
