import 'package:flutter/material.dart';
import 'package:hexagone/types/colour.dart';

abstract class IColourHelper {
  Colour getRandomPrimaryColour();
  Colour getRandomPrimaryOrSecondaryColour();

  Color convert(Colour colour);
}
