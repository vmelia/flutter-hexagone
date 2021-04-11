import 'dart:ui';
import 'package:flutter/material.dart';
import '../types/colour.dart';

extension ColourExtension on Colour {
  Color convert() {
    if (this == Colour.White) return Colors.white;
    if (this == Colour.Red) return Colors.red;
    if (this == Colour.Orange) return Colors.orange;
    if (this == Colour.Yellow) return Colors.yellow;
    if (this == Colour.Green) return Colors.green;
    if (this == Colour.Blue) return Colors.blue;
    if (this == Colour.Purple) return Colors.purple;
    if (this == Colour.Black) return Colors.brown;

    return Colors.transparent;
  }

  Colour merge(Colour other) {
    for (final colourSet in getColourSets()) {
      var tempSet = [...colourSet];
      if (!tempSet.remove(this)) continue;
      if (!tempSet.remove(other)) continue;

      return tempSet[0];
    }

    return Colour.Blue;
  }
}

List<List<Colour>> getColourSets() {
  var colourSets = <List<Colour>>[];
  colourSets.add([Colour.Red, Colour.Red, Colour.White]);
  colourSets.add([Colour.Orange, Colour.Orange, Colour.White]);
  colourSets.add([Colour.Yellow, Colour.Yellow, Colour.White]);
  colourSets.add([Colour.Green, Colour.Green, Colour.White]);
  colourSets.add([Colour.Blue, Colour.Blue, Colour.White]);
  colourSets.add([Colour.Purple, Colour.Purple, Colour.White]);

  colourSets.add([Colour.Red, Colour.Green, Colour.Black]);
  colourSets.add([Colour.Yellow, Colour.Purple, Colour.Black]);
  colourSets.add([Colour.Blue, Colour.Orange, Colour.Black]);

  colourSets.add([Colour.Red, Colour.Yellow, Colour.Orange]);
  colourSets.add([Colour.Yellow, Colour.Blue, Colour.Green]);
  colourSets.add([Colour.Blue, Colour.Red, Colour.Purple]);

  return colourSets;
}
