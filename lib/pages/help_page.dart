import 'package:flutter/material.dart';
import 'package:hexagone/contracts/i_help_text_provider.dart';

import '../locator.dart';

class HelpPage extends StatelessWidget {
  static String route = "HelpPage";

  @override
  Widget build(BuildContext context) {
    final helpTextProvider = locator<IHelpTextProvider>();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('HexaGone'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Stack(children: [
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.white, fontSize: 18),
                children: helpTextProvider.getTextSpans(),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
