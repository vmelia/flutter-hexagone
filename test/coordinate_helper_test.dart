import 'package:hexagone/helpers/coordinate_helper.dart';
import 'package:hexagone/types/coordinate.dart';
import 'package:test/test.dart';

void main() {
  group('CoordinateHelper Tests', () {
    test('getcoordinatesInRange, when range is two, returns nineteen values',
        () {
      var coordinates = CoordinateHelper.getCoordinatesInRange(2);

      expect(coordinates.length, 19);
    });

    test('getcoordinatesInRange, when range is one, returns nine values', () {
      var coordinates = CoordinateHelper.getCoordinatesInRange(1);

      expect(coordinates.length, 9);
    });

    test('getNeighbourOffsets, when called, returns 6 values', () {
      var coordinates = CoordinateHelper.getNeighbourOffsets();

      expect(coordinates.length, 6);
      expect(coordinates.contains(Coordinate(-1, 0)), true);
      expect(coordinates.contains(Coordinate(0, -1)), true);
      expect(coordinates.contains(Coordinate(1, -1)), true);
      expect(coordinates.contains(Coordinate(1, 0)), true);
      expect(coordinates.contains(Coordinate(0, 1)), true);
      expect(coordinates.contains(Coordinate(-1, 1)), true);
    });

    test('getNeighbours, when within edge, returns six values', () {
      var coordinates = CoordinateHelper.getNeighbours(Coordinate(0, -1));

      expect(coordinates.length, 6);
      expect(coordinates.contains(Coordinate(-1, -1)), true);
      expect(coordinates.contains(Coordinate(0, -2)), true);
      expect(coordinates.contains(Coordinate(1, -2)), true);
      expect(coordinates.contains(Coordinate(1, -1)), true);
      expect(coordinates.contains(Coordinate(0, 0)), true);
      expect(coordinates.contains(Coordinate(-1, 0)), true);
    });

    test('getNeighbours, when on edge, returns four values', () {
      var coordinates = CoordinateHelper.getNeighbours(Coordinate(-1, -1));

      expect(coordinates.length, 4);
      expect(coordinates.contains(Coordinate(0, -2)), true);
      expect(coordinates.contains(Coordinate(0, -1)), true);
      expect(coordinates.contains(Coordinate(-1, 0)), true);
      expect(coordinates.contains(Coordinate(-2, 0)), true);
    });

    test('getNeighbours, when on corner, returns three values', () {
      var coordinates = CoordinateHelper.getNeighbours(Coordinate(0, -2));

      expect(coordinates.length, 3);
      expect(coordinates.contains(Coordinate(1, -2)), true);
      expect(coordinates.contains(Coordinate(0, -1)), true);
      expect(coordinates.contains(Coordinate(-1, -1)), true);
    });
  });
}
