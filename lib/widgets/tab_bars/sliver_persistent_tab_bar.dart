import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:neat/neat.dart';
import 'tab_bar.dart' as up;

class _SliverPersistentTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _SliverPersistentTabBarDelegate({
    required this.tabs,
  });

  final List<String> tabs;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final pinned = shrinkOffset != 0;

    // return AnimatedContainer(
    //   duration: kThemeAnimationDuration,
    //   // padding: const EdgeInsets.symmetric(horizontal: up.Dimensions.space3),
    //   // margin: pinned
    //   //     ? EdgeInsets.zero
    //   //     : const EdgeInsets.symmetric(horizontal: up.Dimensions.space3),
    //   decoration: BoxDecoration(
    //     border: Border(
    //       bottom: BorderSide(
    //         color: context.colorScheme.onSurface,
    //       ),
    //     ),
    //   ),
    //   child: up.TabBar(
    //     tabs: tabs,
    //   ),
    // );

    return Container(
      height: up.kTabBarHeight,
      color: context.colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: up.Dimensions.space3),
            child: up.TabBar(
              tabs: tabs,
            ),
          ),
          AnimatedContainer(
            height: 0,
            duration: kThemeAnimationDuration,
            margin: pinned
                ? EdgeInsets.zero
                : const EdgeInsets.symmetric(horizontal: up.Dimensions.space3),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get minExtent => up.kTabBarHeight;

  @override
  double get maxExtent => up.kTabBarHeight;

  // @override
  // FloatingHeaderSnapConfiguration? get snapConfiguration =>
  //     FloatingHeaderSnapConfiguration();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class SliverPersistentTabBar extends SliverPersistentHeader {
  SliverPersistentTabBar({required List<String> tabs})
      : super(
          delegate: _SliverPersistentTabBarDelegate(tabs: tabs),
          pinned: true,
          floating: false,
        );
}
