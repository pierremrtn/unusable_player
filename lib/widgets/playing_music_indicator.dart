import 'package:flutter/material.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

import 'package:neat/neat.dart';

class PlayingMusicIndicator extends StatelessWidget {
  const PlayingMusicIndicator({
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = Theme.of(context).colorScheme.surface;

    return up.DoubleBottomCard(
      padding: up.Dimensions.space3,
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Row(
        children: [
          Icon(
            up.Icons.cd,
            color: foregroundColor,
          ),
          up.Space4(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                context.headline5(
                  "Artist",
                  style: TextStyle(color: foregroundColor),
                ),
                context.bodyText1(
                  "Title of the music",
                  style: TextStyle(color: foregroundColor),
                ),
              ],
            ),
          ),
          up.Space4(),
          Icon(
            up.Icons.play,
            color: foregroundColor,
          ),
        ],
      ),
    );
  }
}
