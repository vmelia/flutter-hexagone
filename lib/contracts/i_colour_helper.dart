import 'package:flutter/material.dart';
import 'package:hexagone/types/Colour.dart';

abstract class IColourHelper {
  bool isPrimary(Colour colour);
  Colour getRandomPrimaryColour();
  Colour getRandomPrimaryOrSecondaryColour();

  Color convert(Colour colour);
}
