import 'package:flutter/material.dart';
import 'package:hexagone/types/Colour.dart';
import 'package:hexagone/view_models/game_view_model.dart';
import 'package:provider/provider.dart';

class HexSelectWidget extends StatelessWidget {
  final double _size = 100;
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GameViewModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RawMaterialButton(
          constraints: BoxConstraints.expand(width: _size, height: _size),
          fillColor: Colors.red,
          shape: CircleBorder(),
          onPressed: () {
            viewModel.selectColour(Colour.Red);
          },
        ),
        RawMaterialButton(
          constraints: BoxConstraints.expand(width: _size, height: _size),
          fillColor: Colors.yellow,
          shape: CircleBorder(),
          onPressed: () {
            viewModel.selectColour(Colour.Yellow);
          },
        ),
        RawMaterialButton(
          constraints: BoxConstraints.expand(width: _size, height: _size),
          fillColor: Colors.blue,
          shape: CircleBorder(),
          onPressed: () {
            viewModel.selectColour(Colour.Blue);
          },
        ),
      ],
    );
  }
}
