import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

class PlaylistCard extends StatelessWidget {
  const PlaylistCard();

  @override
  Widget build(BuildContext context) {
    return up.DoubleBottomCard(
      bottomHorizontalPadding: up.Dimensions.space5,
      padding: up.Dimensions.space5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          up.Image.s2(AssetImage("assets/skeler.jpg")),
          SizedBox(
            width: up.Dimensions.image1.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: up.Dimensions.space4,
                vertical: up.Dimensions.space5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: BodyText2("20 songs"),
                      ),
                      Icon(up.Icons.play_circle_filled),
                    ],
                  ),
                  Headline4("Skeler"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
