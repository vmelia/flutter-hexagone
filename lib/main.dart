import 'package:flutter/material.dart';
import 'package:hexagone/route_builder.dart';
import 'package:hexagone/view_models/game_view_model.dart';
import 'package:provider/provider.dart';
import 'package:hexagone/pages/game_page.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RouteBuilder routeBuilder = RouteBuilder();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        return routeBuilder.generateRoute(context, settings);
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<GameViewModel>(create: (_) => GameViewModel()),
        ],
        child: GamePage(),
      ),
    );
  }
}
