import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/theme/dims.dart';

class UIKit extends StatelessWidget {
  const UIKit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dims.space[1]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(child: Headline1("UI Kit")),
            Headline1("Healdine 1"),
            Headline2("Headline 2"),
            Headline3("Headline 3"),
            Headline4("Headline 4"),
            Headline5("Headline 5"),
            Subtitle1("Subtitle 1"),
            Subtitle2("Subtitle 2"),
            BodyText1("BodyText 1"),
          ],
        ),
      ),
    );
  }
}
