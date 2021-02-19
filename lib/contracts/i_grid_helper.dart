import 'package:hexagone/types/coordinate.dart';
import 'package:hexagone/types/grid.dart';

abstract class IGridHelper {
  Grid createGrid();
  Grid getNeighbours(Grid grid, Coordinate coordinate);
}
