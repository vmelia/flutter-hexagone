import 'coordinate.dart';
import 'difficulty.dart';
import 'grid.dart';

class Game {
  Difficulty difficulty;
  List<Coordinate> initialMoves;
  Grid grid;

  Game(this.difficulty, this.initialMoves, this.grid);

  Game.copy(Game game) {
    difficulty = game.difficulty;
    initialMoves = game.initialMoves;
    grid = Grid.copy(game.grid);
  }
}