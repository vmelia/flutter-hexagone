import 'package:flutter/material.dart';
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
          child: Text('Easy'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {},
          onLongPress: () {
            viewModel.iterations = 4;
            viewModel.startNewGame();
          },
        ),
        RaisedButton(
          child: Text('Medium'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {},
          onLongPress: () {
            viewModel.iterations = 6;
            viewModel.startNewGame();
          },
        ),
        RaisedButton(
          child: Text('Hard'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {},
          onLongPress: () {
            viewModel.iterations = 9;
            viewModel.startNewGame();
          },
        ),
      ],
    );
  }
}
