import 'package:hexagone/contracts/i_colour_merger.dart';
import 'package:hexagone/types/colour.dart';

class ColourMerger implements IColourMerger {
  Colour merge(Colour primaryColour, Colour otherColour) {
    if (primaryColour == otherColour) return Colour.White;

    return Colour.Blue;
  }
}
