part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class NewGameEvent extends GameEvent {
  final Difficulty difficulty;
  NewGameEvent(this.difficulty);
}

class ReplayGameEvent extends GameEvent {
  ReplayGameEvent();
}

class SelectColourEvent extends GameEvent {
  final Colour colour;

  SelectColourEvent(this.colour);
}

class SelectCellEvent extends GameEvent {
  final Coordinate coordinate;

  SelectCellEvent(this.coordinate);
}

class ToggleHintModeEvent extends GameEvent {}
