class Difficulty {
  final String text;
  final int entropy;

  const Difficulty._internal(this.text, this.entropy);
  toString() => 'Enum.$text';

  static const easy = const Difficulty._internal('Easy', 4);
  static const medium = const Difficulty._internal('Medium', 6);
  static const hard = const Difficulty._internal('Hard', 9);
}
