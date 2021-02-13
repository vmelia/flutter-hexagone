import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';

class HexGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HexagonGrid(
      hexType: HexagonType.FLAT,
      color: Colors.blueGrey,
      depth: 2,
      buildTile: (coordinates) => HexagonWidgetBuilder(
        cornerRadius: 8.0,
        child: RawMaterialButton(
          constraints: BoxConstraints.expand(width: 150, height: 150),
          fillColor: Colors.transparent,
          shape: CircleBorder(),
          onPressed: () {},
          child: Text('${coordinates.q}, ${coordinates.r}'),
        ),
        // child: Text('${coordinates.q * coordinates.r}'),
        // Text('${coordinates.x}, ${coordinates.y}, ${coordinates.z}\n  ${coordinates.q}, ${coordinates.r}'),
      ),
    );
  }
}
