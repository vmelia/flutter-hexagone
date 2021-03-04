import 'package:flutter/material.dart';
import 'package:hexagone/contracts/i_colour_helper.dart';
import 'package:hexagone/types/colour.dart';
import 'package:hexagone/view_models/game_view_model.dart';
import 'package:provider/provider.dart';

import '../locator.dart';

class HexSelectWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GameViewModel>(context);
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PrimaryColourWidget(viewModel: viewModel, colour: Colour.Red),
          PrimaryColourWidget(viewModel: viewModel, colour: Colour.Yellow),
          PrimaryColourWidget(viewModel: viewModel, colour: Colour.Blue),
        ],
      ),
      Visibility(
        visible: viewModel.selectedColour == null,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Choose a primary colour",
          ),
        ),
      ),
    ]);
  }
}

class PrimaryColourWidget extends StatelessWidget {
  final double _size = 100;
  final double _notSelectedOpacity = 0.2;

  const PrimaryColourWidget({
    Key key,
    @required this.viewModel,
    @required this.colour,
  }) : super(key: key);

  final GameViewModel viewModel;
  final Colour colour;

  @override
  Widget build(BuildContext context) {
    final _colourHelper = locator<IColourHelper>();
    return Opacity(
      opacity: viewModel.selectedColour == colour ? 1.0 : _notSelectedOpacity,
      child: RawMaterialButton(
        constraints: BoxConstraints.expand(width: _size, height: _size),
        fillColor: _colourHelper.convert(colour),
        shape: CircleBorder(),
        onPressed: () {
          viewModel.selectedColour = colour;
        },
      ),
    );
  }
}
