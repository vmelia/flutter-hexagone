import 'Colour.dart';

class Cell {
  Cell(this.x, this.y);

  final int x;
  final int y;

  Colour colour = Colour.White;

  bool operator ==(o) => o is Cell && x == o.x && y == o.y;
  int get hashCode => x.hashCode ^ y.hashCode;
}
