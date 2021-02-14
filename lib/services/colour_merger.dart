import 'package:hexagone/contracts/i_colour_merger.dart';
import 'package:hexagone/types/colour.dart';

class ColourMerger implements IColourMerger {
  List<List<Colour>> _colourSets;
  ColourMerger() {
    _colourSets = List<List<Colour>>();
    _colourSets.add([Colour.Red, Colour.Red, Colour.White]);
    _colourSets.add([Colour.Yellow, Colour.Yellow, Colour.White]);
    _colourSets.add([Colour.Blue, Colour.Blue, Colour.White]);

    _colourSets.add([Colour.Red, Colour.Green, Colour.Black]);
    _colourSets.add([Colour.Yellow, Colour.Purple, Colour.Black]);
    _colourSets.add([Colour.Blue, Colour.Orange, Colour.Black]);

    _colourSets.add([Colour.Red, Colour.Yellow, Colour.Orange]);
    _colourSets.add([Colour.Yellow, Colour.Blue, Colour.Green]);
    _colourSets.add([Colour.Blue, Colour.Red, Colour.Purple]);
  }

  Colour merge(Colour primaryColour, Colour otherColour) {
    for (final colourSet in _colourSets) {
      var tempSet = [...colourSet];
      if (!tempSet.remove(primaryColour)) continue;
      if (!tempSet.remove(otherColour)) continue;

      return tempSet[0];
    }

    return Colour.Blue;
  }
}
