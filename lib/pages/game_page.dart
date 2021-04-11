import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/game_bloc.dart';
import '../constants.dart';
import '../widgets/colour_select_widget.dart';
import '../widgets/hex_grid_widget.dart';
import '../widgets/menu_widget.dart';
import 'help_page.dart';

class GamePage extends StatelessWidget {
  static String route = 'GamePage';

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
  return Scaffold(
    backgroundColor: Colors.blueGrey,
    appBar: AppBar(
      title: Text(appName),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(top: 7),
            child: MenuWidget(),
          ),
          Stack(
            children: [
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.only(top: 7),
                child: HexGridWidget(),
              ),
              Positioned(
                  top: 5,
                  right: 0,
                  child: ElevatedButton(
                    child: Text(
                      "i",
                      style: TextStyle(color: Colors.white),
                      textScaleFactor: 2.0,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      side: BorderSide(),
                      shape: CircleBorder(),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, HelpPage.route);
                    },
                    onLongPress: () {
                      context.read<GameBloc>().add(ToggleHintModeEvent());
                    },
                  )),
              Positioned(
                  top: 5,
                  left: 5,
                  child: Column(
                    children: [
                      Text(
                        "Moves",
                        style: TextStyle(color: Colors.white),
                        textScaleFactor: 2.0,
                      ),
                      Text(
                        "${gameBloc.movesTaken}",
                        style: TextStyle(color: Colors.white),
                        textScaleFactor: 2.0,
                      ),
                    ],
                  )),
              Positioned(
                  bottom: 5,
                  left: 5,
                  child: Column(
                    children: [
                      Text(
                        "Aim",
                        style: TextStyle(color: Colors.grey),
                        textScaleFactor: 2.0,
                      ),
                      Text(
                        "${gameBloc.game.difficulty.entropy}",
                        style: TextStyle(color: Colors.grey),
                        textScaleFactor: 2.0,
                      ),
                    ],
                  )),
            ],
          ),
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(top: 7),
            child: ColourSelectWidget(),
          ),
        ],
      ),
    ),
  );
}
