part of 'game_bloc.dart';

abstract class GameState {}

class GameInitial extends GameState {
  GameInitial() : super();
}

class GridUpdatedState extends GameState {}

class SelectedColourChangedState extends GameState {} //ToDo: Needed?

class GameOverState extends GameState {
  final int movesTaken;
  GameOverState(this.movesTaken);
}
