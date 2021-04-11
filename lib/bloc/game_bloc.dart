import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../services/game_engine.dart';
import '../types/game.dart';
import '../locator.dart';
import '../types/colour.dart';
import '../types/coordinate.dart';
import '../types/difficulty.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final gameEngine = locator<GameEngine>();
  Game game;
  Game gameSnapshot;

  Colour selectedColour;
  int movesTaken;
  bool hintMode;

  GameBloc() : super(GameInitial());

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is NewGameEvent) {
      _initializeNewGame(event.difficulty);
      yield GridUpdatedState();
    } else if (event is ReplayGameEvent) {
      game = Game.copy(gameSnapshot);
      _resetState();
      yield GridUpdatedState();
    } else if (event is SelectColourEvent) {
      selectedColour = event.colour;
      yield SelectedColourChangedState();
    } else if (event is SelectCellEvent) {
      if (selectedColour == null) return;
      gameEngine.selectCell(game.grid, event.coordinate, selectedColour);
      movesTaken++;
      yield GridUpdatedState();
      if (game.grid.isAllwhite()) {
        yield GameOverState(movesTaken);
      }
    } else if (event is ToggleHintModeEvent) {
      hintMode = !hintMode;
      yield GridUpdatedState();
    }
  }

  void _initializeNewGame(Difficulty difficulty) {
    game = gameEngine.generateRandomGame(difficulty);
    gameSnapshot = Game.copy(game);
    _resetState();
  }

  _resetState() {
    selectedColour = null;
    movesTaken = 0;
    hintMode = false;
  }
}
