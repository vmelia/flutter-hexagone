import 'package:flutter/material.dart';
import 'package:hexagone/view_models/game_view_model.dart';
import 'package:hexagone/widgets/hex_grid_widget.dart';
import 'package:hexagone/widgets/hex_select_widget.dart';
import 'package:hexagone/widgets/menu_widget.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GameViewModel>(context);
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
            child: MenuWidget(),
          ),
          Stack(
            children: [
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.only(top: 7),
                child: HexGridWidget(),
              ),
              Positioned(
                  top: 15,
                  left: 27,
                  child: Text(
                    "${viewModel.idealMoveCount}",
                    textScaleFactor: 2.0,
                  )),
              Positioned(
                  top: 15,
                  right: 27,
                  child: Text(
                    "${viewModel.actualMoveCount}",
                    textScaleFactor: 2.0,
                  )),
            ],
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
