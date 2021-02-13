import 'dart:math';
import 'package:hexagone/services/grid_helper.dart';
import 'package:test/test.dart';

void main() {
  group('GridHelper Tests', () {
    final GridHelper _gridHelper = GridHelper();

    test('getNeighbourOffsets, when called, returns 6 values', () {
      var cells = _gridHelper.getNeighbourOffsets();

      expect(cells.length, 6);
      expect(cells.contains(Point<int>(-1, 0)), true);
      expect(cells.contains(Point<int>(0, -1)), true);
      expect(cells.contains(Point<int>(1, -1)), true);
      expect(cells.contains(Point<int>(1, 0)), true);
      expect(cells.contains(Point<int>(0, 1)), true);
      expect(cells.contains(Point<int>(-1, 1)), true);
    });

    test('getCellsInRange, when range is two, returns nineteen values', () {
      var cells = _gridHelper.getCellsInRange(2);

      expect(cells.length, 19);
    });

    test('getCellsInRange, when range is one, returns nine values', () {
      var cells = _gridHelper.getCellsInRange(1);

      expect(cells.length, 9);
    });

    test('getNeighbours, when within edge, returns six values', () {
      var cells = _gridHelper.getNeighbours(Point<int>(0, -1));

      expect(cells.length, 6);
      expect(cells.contains(Point<int>(-1, -1)), true);
      expect(cells.contains(Point<int>(0, -2)), true);
      expect(cells.contains(Point<int>(1, -2)), true);
      expect(cells.contains(Point<int>(1, -1)), true);
      expect(cells.contains(Point<int>(0, 0)), true);
      expect(cells.contains(Point<int>(-1, 0)), true);
    });

    test('getNeighbours, when on edge, returns four values', () {
      var cells = _gridHelper.getNeighbours(Point<int>(-1, -1));

      expect(cells.length, 4);
      expect(cells.contains(Point<int>(0, -2)), true);
      expect(cells.contains(Point<int>(0, -1)), true);
      expect(cells.contains(Point<int>(-1, 0)), true);
      expect(cells.contains(Point<int>(-2, 0)), true);
    });

    test('getNeighbours, when on corner, returns three values', () {
      var cells = _gridHelper.getNeighbours(Point<int>(0, -2));

      expect(cells.length, 3);
      expect(cells.contains(Point<int>(1, -2)), true);
      expect(cells.contains(Point<int>(0, -1)), true);
      expect(cells.contains(Point<int>(-1, -1)), true);
    });
  });
}
