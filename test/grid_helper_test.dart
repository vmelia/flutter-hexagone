import 'package:hexagone/services/grid_helper.dart';
import 'package:hexagone/types/cell.dart';
import 'package:test/test.dart';

void main() {
  group('GridHelper Tests', () {
    final GridHelper _gridHelper = GridHelper();

    test('getCellsInRange, when range is two, returns nineteen values', () {
      var cells = _gridHelper.getCellsInRange(2);

      expect(cells.length, 19);
    });

    test('getCellsInRange, when range is one, returns nine values', () {
      var cells = _gridHelper.getCellsInRange(1);

      expect(cells.length, 9);
    });

    test('getallCells, when called, returns nineteen values', () {
      var cells = _gridHelper.getallCells();

      expect(cells.length, 19);
    });


    test('getNeighbourOffsets, when called, returns 6 values', () {
      var cells = _gridHelper.getNeighbourOffsets();

      expect(cells.length, 6);
      expect(cells.contains(Cell(-1, 0)), true);
      expect(cells.contains(Cell(0, -1)), true);
      expect(cells.contains(Cell(1, -1)), true);
      expect(cells.contains(Cell(1, 0)), true);
      expect(cells.contains(Cell(0, 1)), true);
      expect(cells.contains(Cell(-1, 1)), true);
    });

    test('getNeighbours, when within edge, returns six values', () {
      var cells = _gridHelper.getNeighbours(Cell(0, -1));

      expect(cells.length, 6);
      expect(cells.contains(Cell(-1, -1)), true);
      expect(cells.contains(Cell(0, -2)), true);
      expect(cells.contains(Cell(1, -2)), true);
      expect(cells.contains(Cell(1, -1)), true);
      expect(cells.contains(Cell(0, 0)), true);
      expect(cells.contains(Cell(-1, 0)), true);
    });

    test('getNeighbours, when on edge, returns four values', () {
      var cells = _gridHelper.getNeighbours(Cell(-1, -1));

      expect(cells.length, 4);
      expect(cells.contains(Cell(0, -2)), true);
      expect(cells.contains(Cell(0, -1)), true);
      expect(cells.contains(Cell(-1, 0)), true);
      expect(cells.contains(Cell(-2, 0)), true);
    });

    test('getNeighbours, when on corner, returns three values', () {
      var cells = _gridHelper.getNeighbours(Cell(0, -2));

      expect(cells.length, 3);
      expect(cells.contains(Cell(1, -2)), true);
      expect(cells.contains(Cell(0, -1)), true);
      expect(cells.contains(Cell(-1, -1)), true);
    });
  });
}
