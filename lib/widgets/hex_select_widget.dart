import 'package:flutter/material.dart';
import 'package:hexagone/types/colour.dart';
import 'package:hexagone/view_models/game_view_model.dart';
import 'package:provider/provider.dart';

class HexSelectWidget extends StatelessWidget {
  final double _size = 100;
  final double _notSelectedOpacity = 0.2;
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GameViewModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Opacity(
          opacity: viewModel.selectedColour == Colour.Red
              ? 1.0
              : _notSelectedOpacity,
          child: RawMaterialButton(
            constraints: BoxConstraints.expand(width: _size, height: _size),
            fillColor: Colors.red,
            shape: CircleBorder(),
            onPressed: () {
              viewModel.selectedColour = Colour.Red;
            },
            onLongPress: () {
              viewModel.initializeGame(3);
            },
          ),
        ),
        Opacity(
          opacity: viewModel.selectedColour == Colour.Yellow
              ? 1.0
              : _notSelectedOpacity,
          child: RawMaterialButton(
            constraints: BoxConstraints.expand(width: _size, height: _size),
            fillColor: Colors.yellow,
            shape: CircleBorder(),
            onPressed: () {
              viewModel.selectedColour = Colour.Yellow;
            },
            onLongPress: () {
              viewModel.initializeGame(6);
            },
          ),
        ),
        Opacity(
          opacity: viewModel.selectedColour == Colour.Blue
              ? 1.0
              : _notSelectedOpacity,
          child: RawMaterialButton(
            constraints: BoxConstraints.expand(width: _size, height: _size),
            fillColor: Colors.blue,
            shape: CircleBorder(),
            onPressed: () {
              viewModel.selectedColour = Colour.Blue;
            },
            onLongPress: () {
              viewModel.initializeGame(9);
            },
          ),
        ),
      ],
    );
  }
}
