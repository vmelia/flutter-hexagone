import 'package:hexagone/contracts/i_grid_helper.dart';
import 'package:hexagone/locator.dart';
import 'package:hexagone/services/grid_helper.dart';
import 'package:test/test.dart';

void main() {
  group('GridHelper Tests', () {
    setupLocator();
    final IGridHelper _gridHelper = GridHelper();

    test('createGrid, when called, returns nineteen values', () {
      var grid = _gridHelper.createGrid();

      expect(grid.length, 19);
    });
  });
}
