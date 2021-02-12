import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';

class GamePage extends StatefulWidget {
  GamePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [_buildGameGrid(context)],
      ),
    );
  }
}

Widget _buildGameGrid(BuildContext context) {
  return InteractiveViewer(
    minScale: 0.2,
    maxScale: 4.0,
    child: HexagonGrid(
      hexType: HexagonType.FLAT,
      color: Colors.blueGrey,
      depth: 2,
      buildTile: (coordinates) => HexagonWidgetBuilder(
        padding: 2.0,
        cornerRadius: 8.0,
        child: OutlineButton(
          color: Colors.transparent,
          shape: CircleBorder(),
          onPressed: () {},
          child: Text('${coordinates.q}, ${coordinates.r}'),
        ),
        // child: Text('${coordinates.q * coordinates.r}'),
        // Text('${coordinates.x}, ${coordinates.y}, ${coordinates.z}\n  ${coordinates.q}, ${coordinates.r}'),
      ),
    ),
  );
}
