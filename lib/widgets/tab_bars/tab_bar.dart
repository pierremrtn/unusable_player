import 'package:flutter/material.dart' hide TabBar;
import 'package:flutter/material.dart' as flutter show TabBar;
import 'package:neat/neat.dart';
import 'package:unusable_player/theme/theme.dart' as up;

const double kTabBarHeight = kToolbarHeight;

class TabBar extends StatelessWidget with PreferredSizeWidget {
  const TabBar({
    this.controller,
    required this.tabs,
    this.isScrollable = false,
  });

  final TabController? controller;
  final List<String> tabs;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return flutter.TabBar(
      controller: controller,
      tabs: tabs.map(_buildTab).toList(),
      padding: EdgeInsets.only(bottom: up.Dimensions.space4),
      isScrollable: isScrollable,
      //labels
      labelPadding: EdgeInsets.zero,
      labelStyle: context.textTheme.headline3!.copyWith(
        fontWeight: FontWeight.bold,
      ),
      labelColor: context.colorScheme.onSurface,
      unselectedLabelStyle: context.textTheme.headline3!.copyWith(
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelColor: up.Colors.lightGrey,
      //indicator
      indicatorColor: context.colorScheme.secondary,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: context.textTheme.headline3!.fontSize! / 1.2,
          color: context.colorScheme.secondary,
        ),
      ),
    );
  }

  Widget _buildTab(
    String label,
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: up.Dimensions.space5,
        ),
        child: Text(
          label,
          overflow: TextOverflow.fade,
          softWrap: false,
        ),
      );

  @override
  Size get preferredSize => Size.fromHeight(kTabBarHeight);
}
