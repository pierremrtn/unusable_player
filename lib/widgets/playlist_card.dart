import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/theme/dimensions.dart';
import 'package:unusable_player/theme/theme.dart';
import 'widgets.dart' as UP;

class PlaylistCard extends StatelessWidget {
  const PlaylistCard();

  @override
  Widget build(BuildContext context) {
    return UP.DoubleBottomCard(
      bottomHorizontalPadding: AppDimensions.space5,
      padding: AppDimensions.space5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UP.Image.s2(AssetImage("assets/skeler.jpg")),
          SizedBox(
            width: AppDimensions.image1.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.space4,
                vertical: AppDimensions.space5,
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
                      Icon(UnusablePlayerIcons.play_circle_filled),
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
