import 'dart:math';
import 'package:hexagone/contracts/i_randomizer.dart';
import 'package:hexagone/types/coordinate.dart';
import 'package:hexagone/types/colour.dart';
import 'package:hexagone/types/grid.dart';

class Randomizer implements IRandomizer {
  Random _random;

  Randomizer() {
    _random = new Random();
  }

  List<Coordinate> getRandomCoordinates(Grid _grid, int count) {
    var coordinates = List<Coordinate>();
    for (var i = 0; i < count; i++) {
      var potentialCoordinate = _getRandomCoordinate(_grid, coordinates);
      coordinates.add(potentialCoordinate);
    }

    return coordinates;
  }

  Colour getRandomPrimaryColour() {
    final r = _random.nextInt(3);
    if (r == 0) return Colour.Red;
    if (r == 1) return Colour.Yellow;
    if (r == 2) return Colour.Blue;

    return Colour.White;
  }

  Colour getRandomPrimaryOrSecondaryColour() {
    final r = _random.nextInt(6) + 1;

    return Colour.values[r];
  }

  Coordinate _getRandomCoordinate(Grid _grid, List<Coordinate> alreadyChosen) {
    var coordinate = _getRandomCoordinatewithoutCheck();
    while (!_grid.cells.containsKey(coordinate) ||
        alreadyChosen.contains(coordinate)) {
      coordinate = _getRandomCoordinatewithoutCheck();
    }

    return coordinate;
  }

  Coordinate _getRandomCoordinatewithoutCheck() {
    var randomX = _random.nextInt(5) - 2;
    var randomY = _random.nextInt(5) - 2;

    return Coordinate(randomX, randomY);
  }
}
