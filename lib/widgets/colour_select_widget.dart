import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/game_bloc.dart';
import '../extensions/colour_extension.dart';
import '../types/colour.dart';

class ColourSelectWidget extends StatelessWidget {
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
  return Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PrimaryColourWidget(colour: Colour.Red),
        PrimaryColourWidget(colour: Colour.Yellow),
        PrimaryColourWidget(colour: Colour.Blue),
      ],
    ),
    Visibility(
      visible: gameBloc.selectedColour == null,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "Choose a primary colour",
        ),
      ),
    ),
  ]);
}

class PrimaryColourWidget extends StatelessWidget {
  final double _size = 100;
  final double _notSelectedOpacity = 0.2;

  const PrimaryColourWidget({
    @required this.colour,
  });

  final Colour colour;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final gameBloc = BlocProvider.of<GameBloc>(context);
    return Opacity(
      opacity: gameBloc.selectedColour == colour ? 1.0 : _notSelectedOpacity,
      child: RawMaterialButton(
        constraints: BoxConstraints.expand(width: _size, height: _size),
        fillColor: colour.convert(),
        shape: CircleBorder(),
        onPressed: () {
          context.read<GameBloc>().add(SelectColourEvent(colour));
        },
      ),
    );
  }
}
