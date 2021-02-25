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
        RaisedButton(
          child: Text(Difficulty.easy.text),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {},
          onLongPress: () {
            viewModel.iterations = Difficulty.easy.value;
            viewModel.startNewGame();
          },
        ),
        RaisedButton(
          child: Text(Difficulty.medium.text),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {},
          onLongPress: () {
            viewModel.iterations = Difficulty.medium.value;
            viewModel.startNewGame();
          },
        ),
        RaisedButton(
          child: Text(Difficulty.hard.text),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {},
          onLongPress: () {
            viewModel.iterations = Difficulty.hard.value;
            viewModel.startNewGame();
          },
        ),
      ],
    );
  }
}
