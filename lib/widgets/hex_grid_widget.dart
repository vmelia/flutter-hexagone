import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexagon/hexagon.dart';

//import '../dialogs/game_over_dialog.dart';
import '../bloc/game_bloc.dart';
import '../extensions/grid_extension.dart';
import '../types/coordinate.dart';

class HexGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(builder: (context, state) {
      if (state is GameInitial) {
        return CircularProgressIndicator();
      }
      
      return _buildWidget(context);
    });
  }
}

Widget _buildWidget(BuildContext context) {
  // ignore: close_sinks
  final gameBloc = BlocProvider.of<GameBloc>(context);
  return HexagonGrid(
    hexType: HexagonType.FLAT,
    depth: 2,
    buildTile: (coordinates) => HexagonWidgetBuilder(
      color: gameBloc.game.grid.getCellColour(Coordinate(coordinates.q, coordinates.r)),
      cornerRadius: 8.0,
      child: SizedBox(
        height: 100,
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.transparent,
            shape: CircleBorder(),
          ),
          onPressed: () async {
            context.read<GameBloc>().add(SelectCellEvent(Coordinate(coordinates.q, coordinates.r)));
          },
          child: gameBloc.hintMode
              ? Text(
                  gameBloc.game.initialMoves.contains(Coordinate(coordinates.q, coordinates.r)) ? 'x' : '',
                  style: TextStyle(color: Colors.black),
                )
              : null,
        ),
      ),
    ),
  );
}
