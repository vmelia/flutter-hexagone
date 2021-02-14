import 'package:hexagone/types/colour.dart';
import 'package:hexagone/types/coordinate.dart';

abstract class IGridHelper {
  Map<Coordinate, Colour> createGrid();
  Map<Coordinate, Colour> getNeighbours(
      Map<Coordinate, Colour> grid, Coordinate coordinate);
}
