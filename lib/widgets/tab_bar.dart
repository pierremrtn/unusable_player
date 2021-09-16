import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flt show TabBar;
import 'package:unusable_player/theme/dimensions.dart';
import 'package:unusable_player/theme/theme.dart';
import 'package:unusable_player/theme/theme_data/colors_scheme.dart';

class TabBar extends StatelessWidget {
  const TabBar({
    this.controller,
    required this.tabs,
  });

  final TabController? controller;
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: AppColors.lightGrey,
          ),
        ),
      ),
      child: flt.TabBar(
        controller: controller,
        tabs: tabs
            .map(
              (tab) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.space5,
                ),
                child: Text(
                  tab,
                  overflow: TextOverflow.fade,
                ),
              ),
            )
            .toList(),
        padding: EdgeInsets.only(bottom: AppDimensions.space4),

        //labels
        labelPadding: EdgeInsets.zero,
        labelStyle: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(fontWeight: FontWeight.bold),
        labelColor: Theme.of(context).colorScheme.onSurface,
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(fontWeight: FontWeight.normal),
        unselectedLabelColor: AppColors.lightGrey,

        //indicator
        indicatorColor: Theme.of(context).colorScheme.secondary,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: Theme.of(context).textTheme.headline3!.fontSize! / 1.2,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
