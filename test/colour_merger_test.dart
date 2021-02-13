import 'package:hexagone/services/colour_merger.dart';
import 'package:hexagone/types/Colour.dart';
import 'package:test/test.dart';

void main() {
  group('ColourMerger Tests', () {
    final ColourMerger _colourMerger = ColourMerger();

    void _testMergeToWhite(Colour colour){
      var actual = _colourMerger.merge(colour, colour);

      expect(actual, Colour.White);
    }

    test('merge, when source and target match, cancels to white', () {
        _testMergeToWhite(Colour.Red);
        _testMergeToWhite(Colour.Yellow);
        _testMergeToWhite(Colour.Blue);
    });
  });
}
