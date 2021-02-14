import 'package:hexagone/types/colour.dart';

abstract class IColourMerger {
  Colour merge(Colour primaryColour, Colour otherColour);
}
