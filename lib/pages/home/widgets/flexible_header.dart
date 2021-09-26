import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

const double kFlexibleHeaderHeight = 208;

class FlexibleHeader extends StatelessWidget {
  const FlexibleHeader({
    required this.tabs,
  });

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: OverflowBox(
        alignment: Alignment.bottomLeft,
        minHeight: 0,
        maxHeight: kFlexibleHeaderHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: up.Dimensions.space2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headline1("Listening Every days"),
              Subtitle1("Explore Millions music evrydays"),
              up.Space3(),
              up.SearchBar(),
              up.Space3(),
              up.TabBar(tabs: tabs),
            ],
          ),
        ),
      ),
    );
  }
}
