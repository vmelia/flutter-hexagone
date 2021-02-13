import 'package:hexagone/contracts/i_grid_helper.dart';
import 'package:hexagone/types/cell.dart';

class GridHelper implements IGridHelper {
  final int _maximumRange = 2;
  List<Cell> _allCells;
  List<Cell> _neighbourOffsets;

  GridHelper() {
    _allCells = getCellsInRange(_maximumRange);
    _neighbourOffsets = getNeighbourOffsets();
  }

  List<Cell> getCellsInRange(int range) {
    var cells = List<Cell>();
    for (var x = -range; x <= range; x++) {
      for (var y = -range; y <= range; y++) {
        var cell = Cell(x, y);
        if (_exists(cell)) cells.add(cell);
      }
    }

    return cells;
  }

  List<Cell> getAllCells() => List.from(_allCells);

  List<Cell> getNeighbourOffsets() {
    final offsets = List<Cell>();
    final cells = getCellsInRange(1);
    for (final cell in cells) {
      if (cell.x != cell.y) if (_exists(cell)) offsets.add(cell);
    }

    return offsets;
  }

  List<Cell> getNeighbours(Cell cell) {
    var cells = List<Cell>();
    for (final o in _neighbourOffsets) {
      var potentialNeighbour = Cell(cell.x + o.x, cell.y + o.y);
      if (_exists(potentialNeighbour)) cells.add(potentialNeighbour);
    }

    return cells;
  }

  bool _exists(Cell cell) {
    if (cell.x < -_maximumRange || cell.x > _maximumRange) return false;
    if (cell.y < -_maximumRange || cell.y > _maximumRange) return false;

    if (cell.x == 1 && cell.y == 2) return false;
    if (cell.x == 2 && cell.y == 1) return false;
    if (cell.x == 2 && cell.y == 2) return false;

    if (cell.x == -1 && cell.y == -2) return false;
    if (cell.x == -2 && cell.y == -1) return false;
    if (cell.x == -2 && cell.y == -2) return false;

    return true;
  }
}
