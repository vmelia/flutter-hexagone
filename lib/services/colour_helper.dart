import 'package:hexagone/contracts/i_colour_helper.dart';
import 'package:hexagone/types/Colour.dart';

class ColourHelper implements IColourHelper {
  bool isPrimary(Colour colour){
    return (colour == Colour.Red || colour == Colour.Yellow || colour == Colour.Blue);
  }
}