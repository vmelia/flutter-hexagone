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
        color:
            viewModel.getCellColour(Coordinate(coordinates.q, coordinates.r)),
        cornerRadius: 8.0,
        child: SizedBox(
          height: 100,
          child: FlatButton(
            color: Colors.transparent,
            shape: CircleBorder(),
            onPressed: () async {
              viewModel.selectCell(Coordinate(coordinates.q, coordinates.r));
              if (viewModel.isGameOver()) {
                var replay = await showAlertDialog(context, viewModel);
                if (replay) {
                  viewModel.replayLastGame();
                } else {
                  viewModel.startNewGame();
                }
              }
            },
            child: null,
          ),
        ),
        // child: Text('${coordinates.q * coordinates.r}'),
        // Text('${coordinates.x}, ${coordinates.y}, ${coordinates.z}\n  ${coordinates.q}, ${coordinates.r}'),
      ),
    );
  }

  Future<bool> showAlertDialog(
      BuildContext context, GameViewModel viewModel) async {
    Widget newButton = FlatButton(
      child: Text("New"),
      onPressed: () => Navigator.pop(context, false),
    );
    Widget replayButton = FlatButton(
      child: Text("Replay"),
      onPressed: () => Navigator.pop(context, true),
    );

    AlertDialog alert = AlertDialog(
      title: Text("Puzzle solved in ${viewModel.moves} moves"),
      content:
          Text("Would you like to play a new puzzle - or replay the last one?"),
      actions: [
        newButton,
        replayButton,
      ],
    );

    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<bool> showGameOverDialog(
      BuildContext context, GameViewModel viewModel) async {
    return await showDialog(
      context: context,
      child: AlertDialog(
        title: Text("Puzzle solved in $viewModel.moves"),
        content: Column(children: [
          Text("Would you like to play a new puzzle - or replay the last one?"),
          Row(
            children: [
              new FlatButton(
                child: new Text("New"),
                onPressed: () => Navigator.pop(context, false),
              ),
              new FlatButton(
                child: new Text("Replay"),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
