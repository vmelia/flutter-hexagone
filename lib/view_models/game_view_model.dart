import 'package:flutter/material.dart';
import 'package:hexagone/contracts/i_colour_helper.dart';
import 'package:hexagone/contracts/i_colour_merger.dart';
import 'package:hexagone/contracts/i_grid_helper.dart';
import 'package:hexagone/types/Colour.dart';
import 'package:hexagone/types/cell.dart';

import '../locator.dart';

class GameViewModel with ChangeNotifier {
  IColourHelper _colourHelper;
  IColourMerger _colourMerger;
  IGridHelper _gridHelper;

  List<Cell> _grid;
  Colour _currentColour;

  GameViewModel() {
    _colourHelper = locator<IColourHelper>();
    _colourMerger = locator<IColourMerger>();
    _gridHelper = locator<IGridHelper>();

    _grid = List<Cell>();
    _currentColour = Colour.Red;
    notifyListeners();
  }

  void selectColour(Colour colour) {
    _currentColour = colour;
    notifyListeners();
  }

  void selectCell(Colour colour) {
    _currentColour = colour;
    notifyListeners();
  }
}
