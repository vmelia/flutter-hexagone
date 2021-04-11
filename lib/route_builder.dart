import 'package:flutter/material.dart';
import 'pages/game_over_page.dart';
import 'pages/help_page.dart';

class RouteBuilder {
  MaterialPageRoute generateRoute(BuildContext context, RouteSettings routeSettings) {
    if (routeSettings.name == HelpPage.route) {
      return MaterialPageRoute(builder: (context) {
        return HelpPage();
      });
    }
    else if (routeSettings.name == GameOverPage.route) {
      return MaterialPageRoute(builder: (context) {
        return GameOverPage();
      });
    }
    return null;
  }
}
