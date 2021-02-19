import 'package:hexagone/contracts/i_grid_helper.dart';
import 'package:hexagone/locator.dart';
import 'package:hexagone/services/grid_helper.dart';
import 'package:hexagone/types/coordinate.dart';
import 'package:hexagone/types/grid.dart';
import 'package:test/test.dart';

void main() {
  group('GridHelper Tests', () {
    setupLocator();
    IGridHelper _gridHelper;
    Grid _grid;

    setUp(() {
      _gridHelper = GridHelper();
      _grid = _gridHelper.createGrid();
    });

    test('createGrid, when called, returns nineteen values', () {
      expect(_grid.count, 19);
    });

    test('getNeighbours, when within edge, returns six values', () {
      var neighbours = _gridHelper.getNeighbours(_grid, Coordinate(0, -1));

      expect(neighbours.count, 6);
    });

    test('getNeighbours, when on edge, returns four values', () {
      var neighbours = _gridHelper.getNeighbours(_grid, Coordinate(-1, -1));

      expect(neighbours.count, 4);
    });

    test('getNeighbours, when on corner, returns three values', () {
      var neighbours = _gridHelper.getNeighbours(_grid, Coordinate(0, -2));

      expect(neighbours.count, 3);
    });
  });
}
