import 'package:flutter/material.dart';
import 'package:hexagone/constants.dart';
import 'package:hexagone/types/difficulty.dart';
import 'package:hexagone/widgets/help_widgets.dart';

class HelpPage extends StatelessWidget {
  static String route = "HelpPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('HexaGone - $versionNumber'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeaderLineWidget("The Rules"),
            TextLineWidget("The aim is to make all the hexagons disappear by adding and subtracting colours."),
            TextLineWidget(
                "Long press on a difficulty level to start a new game. You may do this at any time - to quit the current puzzle."),
            TextLineWidget("Tap on a primary colour to choose your painty weapon."),
            TextLineWidget("Tap a cell to update it and its neighbours."),
            TextLineWidget("If the cell does not contain the primary colour - it will be 'added'."),
            TextLineWidget("If the cell already contains the primary colour - it will be 'subtracted'."),
            TextLineWidget(
              "The puzzle is solved when all the hexagons are white.",
            ),
            HeaderLineWidget("Adding & Subtracting Colours"),
            TextLineWidget("Adding primary colour to a cell:"),
            TextLineWidget("If the cell contains => The result is"),
            TextLineWidget("White => The primary colour"),
            TextLineWidget("The same primary colour => White"),
            TextLineWidget("A different primary colour => A secondary colour"),
            TextLineWidget("A secondary colour already containing the primary => Removes the primary"),
            TextLineWidget("A secondary colour not containing the primary => Brown"),
            TextLineWidget("Brown = The secondary colour that doesn't contain the primary"),
            HeaderLineWidget("Difficulty Levels"),
            TextLineWidget("Easy: Can be done in ${Difficulty.easy.value} moves."),
            TextLineWidget("Medium: Can be done in ${Difficulty.medium.value} moves."),
            TextLineWidget("Hard: Can be done in ${Difficulty.hard.value} moves (good luck)."),
            HeaderLineWidget("Colour Chart"),
            ColourLineWidget(Colors.red, Colors.white, Colors.red),
            ColourLineWidget(Colors.yellow, Colors.white, Colors.yellow),
            ColourLineWidget(Colors.blue, Colors.white, Colors.blue),
            ColourLineWidget(Colors.red, Colors.yellow, Colors.orange),
            ColourLineWidget(Colors.yellow, Colors.blue, Colors.green),
            ColourLineWidget(Colors.blue, Colors.red, Colors.purple),
            ColourLineWidget(Colors.red, Colors.green, Colors.brown),
            ColourLineWidget(Colors.yellow, Colors.purple, Colors.brown),
            ColourLineWidget(Colors.blue, Colors.orange, Colors.brown),
          ]),
        ),
      ),
    );
  }
}
