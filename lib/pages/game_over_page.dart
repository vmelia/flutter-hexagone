import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game_bloc.dart';
import '../constants.dart';
import '../widgets/help_widgets.dart';

class GameOverPage extends StatelessWidget {
  static String route = 'GameOverPage';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(builder: (context, state) {
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
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          HeaderLineWidget('You Win!'),
          TextLineWidget('Puzzle solved in ${gameBloc.movesTaken} moves'),
          TextLineWidget('Would you like to play a new puzzle?'),
          TextLineWidget('Or replay the last one?'),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 200, height: 50),
            child: ElevatedButton(
              child: Text('New Puzzle'),
              style: buttonStyle(),
              onPressed: () {
                context.read<GameBloc>().add(NewGameEvent());
                Navigator.pop(context);
              },
            ),
          ),
          Divider(height: 25),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 200, height: 50),
            child: ElevatedButton(
              child: Text('Replay'),
              style: buttonStyle(),
              onPressed: () {
                context.read<GameBloc>().add(ReplayGameEvent());
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    ),
  );
}

ButtonStyle buttonStyle() {
  return ElevatedButton.styleFrom(
    primary: Colors.grey,
    side: BorderSide(),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
