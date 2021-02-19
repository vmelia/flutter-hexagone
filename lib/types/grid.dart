import 'colour.dart';
import 'coordinate.dart';

class Grid {
  Map<Coordinate, Colour> _cells = Map<Coordinate, Colour>();

  Grid();
  Grid.copy(Grid grid) {
    for (final key in cells.keys) {
      this[key] = grid[key];
    }
  }

  Map<Coordinate, Colour> get cells => _cells;

  operator [](Coordinate coordinate) => cells[coordinate];

  operator []=(coordinate, colour) {
    cells[coordinate] = colour;
  }

  int get length => cells.length; //ToDo: Rename.

  bool contains(Coordinate coordinate) =>
      cells.containsKey(coordinate); //ToDo: Is this needed?

  bool isAllwhite() => !cells.values.any((x) => x != Colour.White);

  //ToDo: Delete.
  get keys => _cells.keys;
  get values => _cells.values;
  bool containsKey(Coordinate coordinate) => _cells.containsKey(coordinate);
}
