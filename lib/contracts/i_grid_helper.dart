import 'package:hexagone/types/cell.dart';

abstract class IGridHelper {
  List<Cell> getCellsInRange(int range);

  List<Cell> getAllCells();

  List<Cell> getNeighbourOffsets();

  List<Cell> getNeighbours(Cell cell);
}
