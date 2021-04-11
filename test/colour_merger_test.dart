import 'package:hexagone/extensions/colour_extension.dart';
import 'package:hexagone/types/colour.dart';
import 'package:test/test.dart';

void main() {
  group('ColourMerger Tests', () {
    void _testMerge(Colour source, Colour target, Colour expected) {
      var actual1 = source.merge(target);
      var actual2 = target.merge(source);

      expect(actual1, expected);
      expect(actual2, expected);
    }

    void _testMergesToWhite(Colour source) {
      _testMerge(source, source, Colour.White);
    }

    void _testMergesFromWhite(Colour source) {
      _testMerge(source, Colour.White, source);
    }

    void _testMergesToBlack(Colour source, Colour target) {
      _testMerge(source, target, Colour.Black);
    }

    void _testMergesFromBlack(Colour source, Colour expected) {
      _testMerge(source, Colour.Black, expected);
    }

    test('merge, when source and target match, cancels to white', () {
      _testMergesToWhite(Colour.Red);
      _testMergesToWhite(Colour.Orange);
      _testMergesToWhite(Colour.Yellow);
      _testMergesToWhite(Colour.Green);
      _testMergesToWhite(Colour.Blue);
      _testMergesToWhite(Colour.Purple);
    });

    test('merge, when target is white, returns source colour', () {
      _testMergesFromWhite(Colour.Red);
      _testMergesFromWhite(Colour.Orange);
      _testMergesFromWhite(Colour.Yellow);
      _testMergesFromWhite(Colour.Green);
      _testMergesFromWhite(Colour.Blue);
      _testMergesFromWhite(Colour.Purple);
    });

    test(
        'merge, when merging primary and  secondary, and does not overlap, returns black',
        () {
      _testMergesToBlack(Colour.Red, Colour.Green);
      _testMergesToBlack(Colour.Yellow, Colour.Purple);
      _testMergesToBlack(Colour.Blue, Colour.Orange);
    });

    test('merge, when target is black, returns opposite colour', () {
      _testMergesFromBlack(Colour.Red, Colour.Green);
      _testMergesFromBlack(Colour.Yellow, Colour.Purple);
      _testMergesFromBlack(Colour.Blue, Colour.Orange);
    });

    test(
        'merge, when source and target are primary, returns correct secondary colour',
        () {
      _testMerge(Colour.Red, Colour.Yellow, Colour.Orange);
      _testMerge(Colour.Yellow, Colour.Blue, Colour.Green);
      _testMerge(Colour.Blue, Colour.Red, Colour.Purple);
    });

    test(
        'merge, when merging primary and secondary, and does overlap, returns correct primary',
        () {
      _testMerge(Colour.Red, Colour.Orange, Colour.Yellow);
      _testMerge(Colour.Red, Colour.Purple, Colour.Blue);
      _testMerge(Colour.Yellow, Colour.Orange, Colour.Red);
      _testMerge(Colour.Yellow, Colour.Green, Colour.Blue);
      _testMerge(Colour.Blue, Colour.Green, Colour.Yellow);
      _testMerge(Colour.Blue, Colour.Purple, Colour.Red);
    });
  });
}
