import 'package:flutter/material.dart';
import 'package:hexagone/widgets/hex_grid_widget.dart';

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
        title: Text('HexaGone'),
      ),
      body: Column(
        children: [HexGridWidget()],
      ),
    );
  }
}
