import 'package:hexagone/types/coordinate.dart';

abstract class ICoordinateHelper {
  Iterable<Coordinate> getCoordinatesInRange(int range);
  Iterable<Coordinate> getNeighbourOffsets();
  List<Coordinate> getNeighbours(Coordinate coordinate);
}
