import 'package:flutter/material.dart';
import 'package:hexagone/widgets/hex_grid_widget.dart';
import 'package:hexagone/widgets/hex_select_widget.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('HexaGone'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(top: 7),
            child: HexGridWidget(),
          ),
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(top: 7),
            child: HexSelectWidget(),
          ),
        ],
      ),
    );
  }
}
