import 'package:flutter/material.dart';
import 'package:hexagone/pages/help_page.dart';

class RouteBuilder {
  MaterialPageRoute generateRoute(BuildContext context, RouteSettings routeSettings) {
    if (routeSettings.name == HelpPage.route) {
      return MaterialPageRoute(builder: (context) {
        return HelpPage();
      });
    }

    return null;
  }
}
