import 'package:flutter/material.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:neat/neat.dart';
import 'tab_bar.dart' as up;

class _SliverPersistentTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _SliverPersistentTabBarDelegate({
    required this.tabs,
    this.forceExpandSeparator,
    this.isScrollable = false,
  });

  final List<String> tabs;
  final bool? forceExpandSeparator;
  final bool isScrollable;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final expandSeparator = forceExpandSeparator ?? shrinkOffset != 0;

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
              isScrollable: isScrollable,
            ),
          ),
          AnimatedContainer(
            height: 0,
            duration: up.Feel.animationDuration,
            curve: up.Feel.animationCurve,
            margin: expandSeparator
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

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class SliverPersistentTabBar extends SliverPersistentHeader {
  SliverPersistentTabBar({
    required List<String> tabs,
    bool? forceExpandSeparator,
    bool isScrollable = false,
    Key? key,
  }) : super(
          key: key,
          delegate: _SliverPersistentTabBarDelegate(
            tabs: tabs,
            forceExpandSeparator: forceExpandSeparator,
            isScrollable: isScrollable,
          ),
          pinned: true,
          floating: false,
        );
}
