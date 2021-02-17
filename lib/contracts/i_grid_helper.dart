import 'package:hexagone/types/colour.dart';
import 'package:hexagone/types/coordinate.dart';

abstract class IGridHelper {
  Map<Coordinate, Colour> createGrid();  
  Map<Coordinate, Colour> copyGrid(Map<Coordinate, Colour> grid);
  Map<Coordinate, Colour> getNeighbours(
      Map<Coordinate, Colour> grid, Coordinate coordinate);
  bool isAllwhite(Map<Coordinate, Colour> grid);
}
