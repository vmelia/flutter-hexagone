import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hexagone/contracts/i_colour_helper.dart';
import 'package:hexagone/types/colour.dart';

class ColourHelper implements IColourHelper {
  Color convert(Colour colour) {
    if (colour == Colour.White) return Colors.white;
    if (colour == Colour.Red) return Colors.red;
    if (colour == Colour.Orange) return Colors.orange;
    if (colour == Colour.Yellow) return Colors.yellow;
    if (colour == Colour.Green) return Colors.green;
    if (colour == Colour.Blue) return Colors.blue;
    if (colour == Colour.Purple) return Colors.purple;
    if (colour == Colour.Black) return Colors.brown;

    return Colors.transparent;
  }
}
