import 'package:hexagone/contracts/i_colour_merger.dart';
import 'package:hexagone/services/colour_merger.dart';
import 'package:hexagone/types/colour.dart';
import 'package:test/test.dart';

void main() {
  group('ColourMerger Tests', () {
    IColourMerger _colourMerger;

    setUp(() {
      _colourMerger = ColourMerger();
    });

    void _testMerge(Colour source, Colour target, Colour expected) {
      var actual = _colourMerger.merge(source, target);

      expect(actual, expected);
    }

    test('merge, when source and target match, cancels to white', () {
      _testMerge(Colour.Red, Colour.Red, Colour.White);
      _testMerge(Colour.Yellow, Colour.Yellow, Colour.White);
      _testMerge(Colour.Blue, Colour.Blue, Colour.White);
    });

    test('merge, when target is white, returns source colour', () {
      _testMerge(Colour.Red, Colour.White, Colour.Red);
      _testMerge(Colour.Yellow, Colour.White, Colour.Yellow);
      _testMerge(Colour.Blue, Colour.White, Colour.Blue);
    });

    test('merge, when target is black, returns opposite colour', () {
      _testMerge(Colour.Red, Colour.Black, Colour.Green);
      _testMerge(Colour.Yellow, Colour.Black, Colour.Purple);
      _testMerge(Colour.Blue, Colour.Black, Colour.Orange);
    });

    test('merge, when target is primary, returns correct secondary colour', () {
      _testMerge(Colour.Red, Colour.Yellow, Colour.Orange);
      _testMerge(Colour.Yellow, Colour.Blue, Colour.Green);
      _testMerge(Colour.Blue, Colour.Red, Colour.Purple);
    });

    test(
        'merge, when target is secondary, and overlaps, returns correct primary colour',
        () {
      _testMerge(Colour.Red, Colour.Orange, Colour.Yellow);
      _testMerge(Colour.Red, Colour.Purple, Colour.Blue);
      _testMerge(Colour.Yellow, Colour.Orange, Colour.Red);
      _testMerge(Colour.Yellow, Colour.Green, Colour.Blue);
      _testMerge(Colour.Blue, Colour.Green, Colour.Yellow);
      _testMerge(Colour.Blue, Colour.Purple, Colour.Red);
    });

    test('merge, when target is secondary, and does not overlap, returns black',
        () {
      _testMerge(Colour.Red, Colour.Green, Colour.Black);
      _testMerge(Colour.Yellow, Colour.Purple, Colour.Black);
      _testMerge(Colour.Blue, Colour.Orange, Colour.Black);
    });
  });
}
