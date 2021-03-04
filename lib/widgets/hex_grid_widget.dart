import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:hexagone/contracts/i_colour_helper.dart';
import 'package:hexagone/types/coordinate.dart';
import 'package:hexagone/view_models/game_view_model.dart';
import 'package:provider/provider.dart';
import '../locator.dart';

class HexGridWidget extends StatelessWidget {
  final colourHelper = locator<IColourHelper>();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GameViewModel>(context);
    return HexagonGrid(
      hexType: HexagonType.FLAT,
      depth: 2,
      buildTile: (coordinates) => HexagonWidgetBuilder(
        color: viewModel.getCellColour(Coordinate(coordinates.q, coordinates.r)),
        cornerRadius: 8.0,
        child: SizedBox(
          height: 100,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.transparent,
              shape: CircleBorder(),
            ),
            onPressed: () async {
              viewModel.selectCell(Coordinate(coordinates.q, coordinates.r));
              if (viewModel.isGameOver()) {
                var replay = await showGameOverDialog(context, viewModel);
                if (replay) {
                  viewModel.replayLastGame();
                } else {
                  viewModel.startNewGame();
                }
              }
            },
            child: viewModel.hintMode
                ? Text(
                    viewModel.randomPaintedCells.contains(Coordinate(coordinates.q, coordinates.r)) ? 'x' : '',
                    style: TextStyle(color: Colors.black),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  Future<bool> showGameOverDialog(BuildContext context, GameViewModel viewModel) async {
    AlertDialog alert = AlertDialog(
      title: Text("Puzzle solved in ${viewModel.moves} moves"),
      content: Text("Would you like to play a new puzzle - or replay the last one?"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      elevation: 12.0,
      backgroundColor: Colors.cyanAccent,
      actions: [
        GameChoiceWidget(
          text: 'New',
          returnValue: false,
        ),
        GameChoiceWidget(
          text: 'Replay',
          returnValue: true,
        ),
      ],
    );

    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class GameChoiceWidget extends StatelessWidget {
  const GameChoiceWidget({
    Key key,
    @required this.text,
    @required this.returnValue,
  }) : super(key: key);

  final String text;
  final bool returnValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(text, style: TextStyle(color: Colors.black)),
        onPressed: () => Navigator.pop(context, returnValue),
        style: ElevatedButton.styleFrom(
          elevation: 10,
          primary: Colors.grey,
          side: BorderSide(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
