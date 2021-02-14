import 'package:flutter/material.dart';
// import 'package:hexagone/contracts/i_colour_helper.dart';
// import 'package:hexagone/contracts/i_colour_merger.dart';
// import 'package:hexagone/contracts/i_grid_helper.dart';
import 'package:hexagone/types/Colour.dart';
// import 'package:hexagone/types/Coordinate.dart';
// import '../locator.dart';

class GameViewModel with ChangeNotifier {
  // IColourHelper _colourHelper;
  // IColourMerger _colourMerger;
  // IGridHelper _gridHelper;

  // List<Coordinate> _grid;
  Colour _selectedColour;

  GameViewModel() {
    // _colourHelper = locator<IColourHelper>();
    // _colourMerger = locator<IColourMerger>();
    // _gridHelper = locator<IGridHelper>();

    // _grid = _gridHelper.getAllcoordinates();

    notifyListeners();
  }

  void selectColour(Colour colour) {
    _selectedColour = colour;

    notifyListeners();
  }

  void selectcoordinate(Colour colour) {
    // Paint Coordinate.

    // Paint neighbours.
    notifyListeners();
  }
}
