import 'package:flutter/material.dart';
import 'package:hexagone/types/colour.dart';

abstract class IColourHelper {
  bool isPrimary(Colour colour);
  Colour getRandomPrimaryColour();
  Colour getRandomPrimaryOrSecondaryColour();

  Color convert(Colour colour);
}
