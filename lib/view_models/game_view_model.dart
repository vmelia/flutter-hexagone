import 'package:flutter/material.dart';
import 'package:hexagone/contracts/i_colour_helper.dart';
import 'package:hexagone/contracts/i_colour_merger.dart';
import 'package:hexagone/contracts/i_grid_helper.dart';
import 'package:hexagone/types/colour.dart';
import 'package:hexagone/types/coordinate.dart';
import '../locator.dart';

class GameViewModel with ChangeNotifier {
  IColourHelper _colourHelper;
  IColourMerger _colourMerger;
  IGridHelper _gridHelper;

  Map<Coordinate, Colour> _grid;
  Colour _selectedColour;

  GameViewModel() {
    _colourHelper = locator<IColourHelper>();
    _colourMerger = locator<IColourMerger>();
    _gridHelper = locator<IGridHelper>();

    _grid = _gridHelper.createGrid();
    for (final key in _grid.keys) {
      _grid[key] = _colourHelper.getRandomPrimaryColour();
    }

    notifyListeners();
  }

  void selectColour(Colour colour) {
    _selectedColour = colour;

    notifyListeners();
  }

  Color getCellColour(Coordinate coordinate) {
    var colour = _grid[coordinate];
    return _colourHelper.convert(colour);
  }

  void selectCell(Coordinate coordinate) {
    var cellColour = _grid[coordinate];
    var newColour = _colourMerger.merge(_selectedColour, cellColour);
    _grid[coordinate] = newColour;

    // Paint neighbours.
    notifyListeners();
  }
}
