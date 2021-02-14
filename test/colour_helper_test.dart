import 'package:hexagone/contracts/i_colour_helper.dart';
import 'package:hexagone/services/colour_helper.dart';
import 'package:hexagone/types/Colour.dart';
import 'package:test/test.dart';

void main() {
  group('ColourHelper Tests', () {
    final IColourHelper _colourHelper = ColourHelper();

    test('isPrimary, when primary, returns true', () {
      expect(_colourHelper.isPrimary(Colour.Red), true);
      expect(_colourHelper.isPrimary(Colour.Yellow), true);
      expect(_colourHelper.isPrimary(Colour.Blue), true);
    });

    test('isPrimary, when not primary, returns false', () {
      expect(_colourHelper.isPrimary(Colour.White), false);
      expect(_colourHelper.isPrimary(Colour.Orange), false);      
      expect(_colourHelper.isPrimary(Colour.Green), false);
      expect(_colourHelper.isPrimary(Colour.Purple), false);
      expect(_colourHelper.isPrimary(Colour.Brown), false);
    });
  });
}