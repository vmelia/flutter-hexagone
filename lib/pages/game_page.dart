import 'package:flutter/material.dart';
import 'package:hexagone/view_models/game_view_model.dart';
import 'package:hexagone/widgets/hex_grid_widget.dart';
import 'package:hexagone/widgets/hex_select_widget.dart';
import 'package:hexagone/widgets/menu_widget.dart';
import 'package:provider/provider.dart';

import 'help_page.dart';

class GamePage extends StatelessWidget {
  static String route = "GamePage";

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GameViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('HexaGone'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    top: 5,
                    right: 0,
                    child: ElevatedButton(
                      child: Text(
                        "i",
                        style: TextStyle(color: Colors.white),
                        textScaleFactor: 2.0,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        side: BorderSide(),
                        shape: CircleBorder(),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, HelpPage.route);
                      },
                      onLongPress: () {
                        viewModel.hintMode = !viewModel.hintMode;
                      },
                    )),
                Positioned(
                    top: 5,
                    left: 5,
                    child: Column(
                      children: [
                        Text(
                          "Moves",
                          style: TextStyle(color: Colors.white),
                          textScaleFactor: 2.0,
                        ),
                        Text(
                          "${viewModel.moves}",
                          style: TextStyle(color: Colors.white),
                          textScaleFactor: 2.0,
                        ),
                      ],
                    )),
                Positioned(
                    bottom: 5,
                    left: 5,
                    child: Column(
                      children: [
                        Text(
                          "Aim",
                          style: TextStyle(color: Colors.grey),
                          textScaleFactor: 2.0,
                        ),
                        Text(
                          "${viewModel.iterations}",
                          style: TextStyle(color: Colors.grey),
                          textScaleFactor: 2.0,
                        ),
                      ],
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
      ),
    );
  }
}
