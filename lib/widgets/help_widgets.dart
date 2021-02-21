import 'package:flutter/material.dart';

const double _textFontSize = 18;
const double _colourFontSize = 48;
const String _circle = "\u2B24";

class ColourWidget extends StatelessWidget {
  final Color colour;

  ColourWidget(this.colour);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: _circle,
      style: TextStyle(
        color: colour,
        fontSize: _colourFontSize,
      ),
    ));
  }
}

class TextWidget extends StatelessWidget {
  final String text;

  TextWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(color: Colors.black, fontSize: _colourFontSize),
      ),
    );
  }
}

class ColourLineWidget extends StatelessWidget {
  final Color colour1;
  final Color colour2;
  final Color colour3;

  ColourLineWidget(this.colour1, this.colour2, this.colour3);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ColourWidget(colour1),
      TextWidget('+'),
      ColourWidget(colour2),
      TextWidget('='),
      ColourWidget(colour3),
      Spacer(),
      ColourWidget(colour1),
      TextWidget('+'),
      ColourWidget(colour3),
      TextWidget('='),
      ColourWidget(colour2),
    ]);
  }
}

class HeaderLineWidget extends StatelessWidget {
  final String text;

  HeaderLineWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$text\n",
        style: TextStyle(
          color: Colors.white,
          fontSize: _textFontSize,
        ),
      ),
    );
  }
}

class TextLineWidget extends StatelessWidget {
  final String text;

  TextLineWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$text\n",
        style: TextStyle(
          color: Colors.black,
          fontSize: _textFontSize,
        ),
      ),
    );
  }
}
