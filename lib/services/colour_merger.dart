import 'package:hexagone/types/Colour.dart';

class ColourMerger {
  Colour merge(Colour primaryColour, Colour otherColour) {
    if (primaryColour == otherColour) return Colour.White;
    
    return Colour.Blue;
  }
}
