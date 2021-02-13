import 'package:flutter/material.dart';
// import 'package:hexagone/pages/example_page.dart';
import 'package:hexagone/view_models/game_view_model.dart';
import 'package:provider/provider.dart';
import 'package:hexagone/pages/game_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ChangeNotifierProvider(
          create: (context) => GameViewModel(),
          child: GamePage(),
          //child: ExamplePage(),
        ));
  }
}
