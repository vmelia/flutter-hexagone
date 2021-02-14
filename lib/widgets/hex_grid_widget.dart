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
            onPressed: () {
              viewModel.selectCell(Coordinate(coordinates.q, coordinates.r));
            },
            child: null,
          ),
        ),
        // child: Text('${coordinates.q * coordinates.r}'),
        // Text('${coordinates.x}, ${coordinates.y}, ${coordinates.z}\n  ${coordinates.q}, ${coordinates.r}'),
      ),
    );
  }
}
