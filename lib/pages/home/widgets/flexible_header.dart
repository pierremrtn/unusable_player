import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

const double kFlexibleHeaderHeight = 210;

class FlexibleHeader extends StatelessWidget {
  const FlexibleHeader({
    required this.tabs,
  });

  final List<String> tabs;

  // @override
  // Widget build(BuildContext context) {
  //   return LayoutBuilder(builder: (
  //     BuildContext context,
  //     BoxConstraints constraints,
  //   ) {
  //     final bool isExpanded = constraints.maxHeight >= kFlexibleHeaderHeight;

  //     return ClipRect(
  //       child: OverflowBox(
  //         alignment: Alignment.bottomLeft,
  //         minHeight: 0,
  //         maxHeight: kFlexibleHeaderHeight,
  //         child: Padding(
  //           padding:
  //               const EdgeInsets.symmetric(horizontal: up.Dimensions.space2),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: [
  //               context.headline1("Listening Every days"),
  //               context.subtitle1("Explore Millions music evrydays"),
  //               up.Space3(),
  //               up.SearchBar(),
  //               up.Space3(),
  //               up.TabBar(tabs: tabs),
  //               Divider(
  //                 height: 1,
  //                 thickness: 1,
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
          // width: 200,
          // height: 200,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: up.Dimensions.space2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  context.headline1("Listening Every days"),
                  context.subtitle1("Explore Millions music evrydays"),
                  up.Space3(),
                  up.SearchBar(),
                  up.Space3(),
                  up.TabBar(tabs: tabs),
                  Divider(
                    height: 1,
                    thickness: 1,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
