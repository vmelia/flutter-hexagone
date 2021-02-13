import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:hexagone/contracts/i_colour_helper.dart';
import '../locator.dart';

class HexGridWidget extends StatelessWidget {
  final colourHelper = locator<IColourHelper>();

  @override
  Widget build(BuildContext context) {
    return HexagonGrid(
      hexType: HexagonType.FLAT,
      depth: 2,
      buildTile: (coordinates) => HexagonWidgetBuilder(
        color: colourHelper
            .convert(colourHelper.getRandomPrimaryOrSecondaryColour()),
        cornerRadius: 8.0,
        child: SizedBox(
          height: 100,
          child: FlatButton(
            color: Colors.transparent,
            shape: CircleBorder(),
            onPressed: () {},
            child: Text('${coordinates.q}, ${coordinates.r}'),
          ),
        ),
        // child: Text('${coordinates.q * coordinates.r}'),
        // Text('${coordinates.x}, ${coordinates.y}, ${coordinates.z}\n  ${coordinates.q}, ${coordinates.r}'),
      ),
    );
  }
}
