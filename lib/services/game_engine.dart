import 'randomizer.dart';
import '../extensions/colour_extension.dart';
import '../helpers/grid_helper.dart';
import '../locator.dart';
import '../types/colour.dart';
import '../types/coordinate.dart';
import '../types/difficulty.dart';
import '../types/game.dart';
import '../types/grid.dart';

abstract class GameEngine {
  Game generateRandomGame(Difficulty difficulty);
  void selectCell(Grid grid, Coordinate coordinate, Colour selectedColour);
}

class GameEngineImpl implements GameEngine {
  Randomizer randomizer = locator<Randomizer>();
  @override
  Game generateRandomGame(Difficulty difficulty) {
    final grid = GridHelper.createEmptyGrid();
    final initialMoves = randomizer.getRandomCoordinates(grid, difficulty.entropy);
    for (var randomCoordinate in initialMoves) {
      var colour = randomizer.getRandomPrimaryColour();
      selectCell(grid, randomCoordinate, colour);
      print('${randomCoordinate.x}, ${randomCoordinate.y}, $colour');
    }

    return Game(difficulty, initialMoves, grid);
  }

  void selectCell(Grid grid, Coordinate coordinate, Colour selectedColour) {
    _mergeCell(grid, coordinate, selectedColour);
    var neighbours = GridHelper.getNeighbours(grid, coordinate);
    for (final c in neighbours.coordinates) {
      _mergeCell(grid, c, selectedColour);
    }
  }

  void _mergeCell(Grid grid, Coordinate coordinate, Colour selectedColour) {
    Colour cellColour = grid[coordinate];
    Colour newColour = cellColour.merge(selectedColour);

    grid[coordinate] = newColour;
  }
}
