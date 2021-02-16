import 'package:flutter/material.dart';
import 'package:hexagone/contracts/i_help_text_provider.dart';

class HelpTextProvider implements IHelpTextProvider {
  List<TextSpan> getTextSpans() {
    return <TextSpan>[
      _createHeaderTextSpan("The rules"),
      _createSpacedTextSpan(
          "The aim is to make all the hexagons disappear by adding and subtracting colours."),
      _createSpacedTextSpan(
          "Long press on a difficulty level to start a new game."),
      _createSpacedTextSpan(
          "Tap on a primary colour to choose your painty weapon."),
      _createSpacedTextSpan("Tap a cell to update it and its neighbours."),
      _createSpacedTextSpan(
          "If the cell does not contain the primary colour - it will be 'added'."),
      _createSpacedTextSpan(
          "If the cell already contains the primary colour - it will be 'subtracted'."),
      _createSpacedTextSpan(
          "The puzzle is solved when all the hexagons are white."),
      _createHeaderTextSpan("Adding & subtracting colours"),
      _createSpacedTextSpan("Using the RED primary as an example:"),
      _createTextSpan("RED + WHITE = RED"),
      _createSpacedTextSpan("RED + RED = WHITE (the red is cancelled out)"),
      _createTextSpan("RED + YELLOW = ORANGE"),
      _createSpacedTextSpan("RED + BLUE = PURPLE"),
      _createTextSpan("RED + ORANGE = YELLOW"),
      _createTextSpan("RED + PURPLE = BLUE"),
      _createSpacedTextSpan(
          "RED + GREEN = BROWN (all three primaries combined)"),
      _createSpacedTextSpan(
          "The YELLOW and BLUE primaries follow the same pattern."),
      _createHeaderTextSpan("Difficulty levels"),
      _createSpacedTextSpan("Easy: Can be done in 3 moves."),
      _createSpacedTextSpan("Medium: Can be done in 6 moves."),
      _createTextSpan("Hard: Can be done in 9 moves."),
      _createTextSpan("(Good luck with that!)"),
    ];
  }

  TextSpan _createHeaderTextSpan(String text) => TextSpan(
        text: "$text\n\n",
        style: TextStyle(color: Colors.black, fontSize: 24),
      );

  TextSpan _createSpacedTextSpan(String text) => TextSpan(text: "$text\n\n");
  TextSpan _createTextSpan(String text) => TextSpan(text: "$text\n");
}
