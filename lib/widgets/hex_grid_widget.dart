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
                    viewModel.randomPaintedCells
                            .contains(Coordinate(coordinates.q, coordinates.r))
                        ? 'x'
                        : '',
                  )
                : null,
          ),
        ),
      ),
    );
  }

  //ToDo: Move this!
  Future<bool> showGameOverDialog(
      BuildContext context, GameViewModel viewModel) async {
    AlertDialog alert = AlertDialog(
      title: Text("Puzzle solved in ${viewModel.moves} moves"),
      content:
          Text("Would you like to play a new puzzle - or replay the last one?"),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      elevation: 12.0,
      backgroundColor: Colors.cyan,
      actions: [
        RaisedButton(
          child: Text("New", style: TextStyle(color: Colors.black)),
          onPressed: () => Navigator.pop(context, false),
          elevation: 24,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          )),
        ),
        RaisedButton(
          child: Text("Replay", style: TextStyle(color: Colors.black)),
          onPressed: () => Navigator.pop(context, true),
          elevation: 24,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          )),
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
