import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hexagone/contracts/i_colour_helper.dart';
import 'package:hexagone/types/Colour.dart';

class ColourHelper implements IColourHelper {
  Random _random;

  ColourHelper() {
    _random = new Random();
  }

  Color convert(Colour colour) {
    if (colour == Colour.White) return Colors.white;
    if (colour == Colour.Red) return Colors.red;
    if (colour == Colour.Orange) return Colors.orange;
    if (colour == Colour.Yellow) return Colors.yellow;
    if (colour == Colour.Green) return Colors.green;
    if (colour == Colour.Blue) return Colors.blue;
    if (colour == Colour.Purple) return Colors.purple;
    if (colour == Colour.Brown) return Colors.brown;

    return Colors.transparent;
  }

  bool isPrimary(Colour colour) {
    return (colour == Colour.Red ||
        colour == Colour.Yellow ||
        colour == Colour.Blue);
  }

  Colour getRandomPrimaryColour() {
    final r = _random.nextInt(3);
    if (r == 0) return Colour.Red;
    if (r == 1) return Colour.Yellow;
    if (r == 2) return Colour.Blue;

    return Colour.White;
  }

  @override
  Colour getRandomPrimaryOrSecondaryColour() {
    final r = _random.nextInt(6) + 1;

    return Colour.values[r];
  }
}
