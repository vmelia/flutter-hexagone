import 'package:flutter/material.dart';

class HexSelectWidget extends StatelessWidget {
  final double _size = 100;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RawMaterialButton(
          constraints: BoxConstraints.expand(width: _size, height: _size),
          fillColor: Colors.red,
          shape: CircleBorder(),
          onPressed: () {},
        ),
        RawMaterialButton(
          constraints: BoxConstraints.expand(width: _size, height: _size),
          fillColor: Colors.yellow,
          shape: CircleBorder(),
          onPressed: () {},
        ),
        RawMaterialButton(
          constraints: BoxConstraints.expand(width: _size, height: _size),
          fillColor: Colors.blue,
          shape: CircleBorder(),
          onPressed: () {},
        ),
      ],
    );
  }
}
