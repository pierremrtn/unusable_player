import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/theme/dimensions.dart';
import 'package:unusable_player/theme/theme.dart';
import 'widgets.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard();

  @override
  Widget build(BuildContext context) {
    return DoubleBottomCard(
      bottomHorizontalPadding: AppDimensions.space5,
      padding: AppDimensions.space5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/skeler.jpg"),
            width: AppDimensions.image1.width,
            height: AppDimensions.image1.height,
            frameBuilder: (context, child, _, __) => ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadius2),
              child: child,
            ),
          ),
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
