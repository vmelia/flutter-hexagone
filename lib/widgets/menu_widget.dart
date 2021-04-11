import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/game_bloc.dart';
import '../types/difficulty.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildWidget(context);
  }
}

Widget _buildWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      DifficultyWidget(difficulty: Difficulty.easy),
      DifficultyWidget(difficulty: Difficulty.medium),
      DifficultyWidget(difficulty: Difficulty.hard),
    ],
  );
}

class DifficultyWidget extends StatelessWidget {
  const DifficultyWidget({
    @required this.difficulty,
  });

  final Difficulty difficulty;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        child: Text(difficulty.text),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
          side: BorderSide(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        onLongPress: () {
          context.read<GameBloc>().add(NewGameEvent(difficulty: difficulty));
        },
      ),
    );
  }
}
