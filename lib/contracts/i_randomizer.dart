import 'package:hexagone/types/colour.dart';
import 'package:hexagone/types/coordinate.dart';
import 'package:hexagone/types/grid.dart';

abstract class IRandomizer {
  List<Coordinate> getRandomCoordinates(Grid _grid, int count);
  Colour getRandomPrimaryColour();
  Colour getRandomPrimaryOrSecondaryColour();
}
