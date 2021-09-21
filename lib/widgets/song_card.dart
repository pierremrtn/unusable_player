import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/theme/dimensions.dart';
import 'package:unusable_player/theme/theme.dart';
import 'package:unusable_player/widgets/widgets.dart' as UP;

class SongCard extends StatelessWidget {
  const SongCard();

  @override
  Widget build(BuildContext context) {
    return UP.DoubleBottomCard(
      padding: AppDimensions.space4,
      child: SizedBox(
        height: AppDimensions.image3.height,
        child: Row(
          children: [
            UP.Image.s3(AssetImage("assets/skeler.jpg")),
            UP.Space4(),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: AppDimensions.space5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Headline5("Marshmello"),
                    Row(
                      children: [
                        Expanded(child: Subtitle2("Hate The Other Side")),
                        BodyText2("3:14"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
