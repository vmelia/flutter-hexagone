import 'package:hexagone/types/Colour.dart';

class ColourHelper{
  bool isPrimary(Colour colour){
    return (colour == Colour.Red || colour == Colour.Yellow || colour == Colour.Blue);
  }
}