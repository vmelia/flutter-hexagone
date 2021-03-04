import 'package:flutter/material.dart';
import 'package:hexagone/types/difficulty.dart';
import 'package:hexagone/view_models/game_view_model.dart';
import 'package:provider/provider.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GameViewModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DifficultyWidget(viewModel: viewModel, difficulty: Difficulty.easy),
        DifficultyWidget(viewModel: viewModel, difficulty: Difficulty.medium),
        DifficultyWidget(viewModel: viewModel, difficulty: Difficulty.hard),
      ],
    );
  }
}

class DifficultyWidget extends StatelessWidget {
  const DifficultyWidget({
    Key key,
    @required this.viewModel,
    @required this.difficulty,
  }) : super(key: key);

  final GameViewModel viewModel;
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
          viewModel.iterations = difficulty.value;
          viewModel.startNewGame();
        },
      ),
    );
  }
}
