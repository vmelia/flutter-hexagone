import 'package:equatable/equatable.dart';

class Coordinate extends Equatable {
  Coordinate(this.x, this.y);

  final int x;
  final int y;

  @override
  List<Object> get props => [x, y];
}
