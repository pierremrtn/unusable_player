import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

class SongCard extends StatelessWidget {
  const SongCard();

  @override
  Widget build(BuildContext context) {
    return up.DoubleBottomCard(
      padding: up.Dimensions.space4,
      child: Row(
        children: [
          up.Image.s3(AssetImage("assets/skeler.jpg")),
          up.Space4(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                context.headline5("Marshmello"),
                up.Space5(),
                Row(
                  children: [
                    Expanded(
                      child: context.subtitle2("Hate The Other Side"),
                    ),
                    context.bodyText2("3:14"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
