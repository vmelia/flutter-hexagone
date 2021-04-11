import 'package:hexagone/helpers/grid_helper.dart';
import 'package:hexagone/locator.dart';
import 'package:hexagone/types/coordinate.dart';
import 'package:hexagone/types/grid.dart';
import 'package:test/test.dart';

void main() {
  group('GridHelper Tests', () {
    setupLocator();
    Grid _grid;

    setUp(() {
      _grid = GridHelper.createEmptyGrid();
    });

    test('createGrid, when called, returns nineteen values', () {
      expect(_grid.count, 19);
    });

    test('getNeighbours, when within edge, returns six values', () {
      var neighbours = GridHelper.getNeighbours(_grid, Coordinate(0, -1));

      expect(neighbours.count, 6);
    });

    test('getNeighbours, when on edge, returns four values', () {
      var neighbours = GridHelper.getNeighbours(_grid, Coordinate(-1, -1));

      expect(neighbours.count, 4);
    });

    test('getNeighbours, when on corner, returns three values', () {
      var neighbours = GridHelper.getNeighbours(_grid, Coordinate(0, -2));

      expect(neighbours.count, 3);
    });
  });
}
