import 'package:flutter/material.dart';
import 'package:hexagone/contracts/i_colour_helper.dart';
import 'package:hexagone/contracts/i_colour_merger.dart';
import 'package:hexagone/contracts/i_grid_helper.dart';
import 'package:hexagone/contracts/i_randomizer.dart';
import 'package:hexagone/types/colour.dart';
import 'package:hexagone/types/coordinate.dart';
import '../locator.dart';

class GameViewModel with ChangeNotifier {
  IColourHelper _colourHelper;
  IColourMerger _colourMerger;
  IGridHelper _gridHelper;
  IRandomizer _randomizer;

  Map<Coordinate, Colour> _grid;
  Colour _selectedColour;

  GameViewModel() {
    _colourHelper = locator<IColourHelper>();
    _colourMerger = locator<IColourMerger>();
    _gridHelper = locator<IGridHelper>();
    _randomizer = locator<IRandomizer>();

    initializeGame(6); // Medium.
  }

  Colour get selectedColour => _selectedColour;

  set selectedColour(Colour colour) {
    _selectedColour = colour;

    notifyListeners();
  }

  Color getCellColour(Coordinate coordinate) {
    var colour = _grid[coordinate];
    return _colourHelper.convert(colour);
  }

  void selectCell(Coordinate coordinate) {
    if (selectedColour == null) return; //ToDo: Neaten?

    processCell(coordinate);
    var neighbours = _gridHelper.getNeighbours(_grid, coordinate);
    for (final c in neighbours.keys) {
      processCell(c);
    }

    notifyListeners();
  }

  void processCell(Coordinate coordinate) {
    var colour = _grid[coordinate];
    var newColour = _colourMerger.merge(colour, _selectedColour);

    _grid[coordinate] = newColour;
  }

  void initializeGame(int iterations) {
    _grid = _gridHelper.createGrid();
    var randomCoordinates = _randomizer.getRandomCoordinates(_grid, iterations);
    for(var randomCoordinate in randomCoordinates){
      selectedColour = _randomizer.getRandomPrimaryColour();
      selectCell(randomCoordinate);
      print('${randomCoordinate.x}, ${randomCoordinate.y}, $selectedColour');
    }

    selectedColour = null;
  }
}
