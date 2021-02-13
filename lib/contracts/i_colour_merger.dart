import 'package:hexagone/types/Colour.dart';

abstract class IColourMerger {
  Colour merge(Colour primaryColour, Colour otherColour);
}
