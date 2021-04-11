import 'package:flutter/material.dart';
import '../types/colour.dart';
import '../types/coordinate.dart';
import '../types/grid.dart';
import 'colour_extension.dart';

extension GridExtension on Grid {
  Color getCellColour(Coordinate coordinate) {
    Colour colour = this[coordinate];
    return colour.convert();
  }
}
