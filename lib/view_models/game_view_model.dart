import 'package:flutter/material.dart';
import 'package:hexagone/contracts/i_colour_helper.dart';
import 'package:hexagone/contracts/i_colour_merger.dart';
import 'package:hexagone/contracts/i_grid_helper.dart';
import 'package:hexagone/contracts/i_randomizer.dart';
import 'package:hexagone/types/colour.dart';
import 'package:hexagone/types/coordinate.dart';
import 'package:hexagone/types/grid.dart';
import '../locator.dart';

class GameViewModel with ChangeNotifier {
  IColourHelper _colourHelper;
  IColourMerger _colourMerger;
  IGridHelper _gridHelper;
  IRandomizer _randomizer;

  Grid _grid;
  Grid _previousGrid;
  Colour _selectedColour;
  List<Coordinate> _randomPaintedCells;

  int iterations = 6;
  int _moves = 0;
  bool _hintMode = false;

  GameViewModel() {
    _colourHelper = locator<IColourHelper>();
    _colourMerger = locator<IColourMerger>();
    _gridHelper = locator<IGridHelper>();
    _randomizer = locator<IRandomizer>();

    startNewGame();
  }

  int get moves => _moves;
  bool get hintMode => _hintMode;
  set hintMode(bool value) {
    _hintMode = value;

    notifyListeners();
  }

  Colour get selectedColour => _selectedColour;

  set selectedColour(Colour value) {
    _selectedColour = value;

    notifyListeners();
  }

  Color getCellColour(Coordinate coordinate) {
    var colour = _grid[coordinate];
    return _colourHelper.convert(colour);
  }

  List<Coordinate> get randomPaintedCells => _randomPaintedCells;

  void selectCell(Coordinate coordinate) {
    if (selectedColour == null) return;

    processCell(coordinate);
    var neighbours = _gridHelper.getNeighbours(_grid, coordinate);
    for (final c in neighbours.coordinates) {
      processCell(c);
    }

    _moves++;
    notifyListeners();
  }

  void processCell(Coordinate coordinate) {
    var colour = _grid[coordinate];
    var newColour = _colourMerger.merge(colour, _selectedColour);

    _grid[coordinate] = newColour;
  }

  // Game initialization.
  bool isGameOver() => _grid.isAllwhite();

  void startNewGame() {
    _grid = _gridHelper.createGrid();

    _randomPaintedCells = _randomizer.getRandomCoordinates(_grid, iterations);
    for (var randomCoordinate in randomPaintedCells) {
      selectedColour = _randomizer.getRandomPrimaryColour();
      selectCell(randomCoordinate);
      print('${randomCoordinate.x}, ${randomCoordinate.y}, $selectedColour');
    }

    _moves = 0;
    selectedColour = null;
    _previousGrid = Grid.copy(_grid);
  }

  void replayLastGame() {
    _grid = Grid.copy(_previousGrid);

    _moves = 0;
    selectedColour = null;
  }
}
