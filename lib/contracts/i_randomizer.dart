import 'package:hexagone/types/colour.dart';
import 'package:hexagone/types/coordinate.dart';

abstract class IRandomizer {
  List<Coordinate> getRandomCoordinates(
      Map<Coordinate, Colour> _grid, int count);
  Colour getRandomPrimaryColour();
  Colour getRandomPrimaryOrSecondaryColour();
}
