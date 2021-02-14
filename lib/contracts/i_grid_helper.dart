import 'package:hexagone/types/Colour.dart';
import 'package:hexagone/types/coordinate.dart';

abstract class IGridHelper {
  Map<Coordinate, Colour> createGrid();
}
