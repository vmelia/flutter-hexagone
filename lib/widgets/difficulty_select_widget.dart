import 'package:flutter/material.dart';
import '../bloc/game_bloc.dart';

class DifficultySelectWidget extends StatelessWidget {
  const DifficultySelectWidget({
    @required this.text,
    @required this.returnValue,
  });

  final String text;
  final GameEvent returnValue;

  @override
  Widget build(BuildContext context) {
    return _buildWidget(context);
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(text, style: TextStyle(color: Colors.black)),
        onPressed: () => Navigator.pop(context, returnValue),
        style: ElevatedButton.styleFrom(
          elevation: 10,
          primary: Colors.grey,
          side: BorderSide(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
