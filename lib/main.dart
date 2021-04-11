import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexagone/pages/game_over_page.dart';
import 'package:hexagone/route_builder.dart';
import 'bloc/game_bloc.dart';
import 'pages/game_page.dart';
import 'constants.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RouteBuilder routeBuilder = RouteBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameBloc>(
      create: (context) => GameBloc()..add(NewGameEvent()),
      child: MaterialApp(
        onGenerateRoute: (settings) {
          return routeBuilder.generateRoute(context, settings);
        },
        title: appName,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocConsumer<GameBloc, GameState>(
          listener: (context, state) {
            if (state is GameOverState) {
              Navigator.pushNamed(context, GameOverPage.route);
            }
          },
          builder: (context, state) {
            return GamePage();
          },
        ),
      ),
    );
  }
}
