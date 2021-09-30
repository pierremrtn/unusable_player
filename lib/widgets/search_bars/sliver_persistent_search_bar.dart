import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:neat/neat.dart';
import 'search_bar.dart' as up;

class _SliverPersistentSearchBarDelegate
    extends SliverPersistentHeaderDelegate {
  const _SliverPersistentSearchBarDelegate({
    this.onSearch,
    EdgeInsets? padding,
    Curve? curve,
  })  : padding = padding ?? EdgeInsets.zero,
        curve = curve ?? Curves.easeInOutCubicEmphasized;

  final EdgeInsets padding;
  final Curve curve;
  final Function(String)? onSearch;

  double get extent => padding.vertical + up.kSearchBarHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final normalizedVisibility = curve.transform(
      (extent - shrinkOffset) / extent,
    );
    final deviceWidth = MediaQuery.of(context).size.width;
    final xOffest = deviceWidth * (1 - normalizedVisibility);
    final opacity = 1 - (shrinkOffset / extent);

    return Container(
      padding: padding,
      color: context.colorScheme.surface,
      child: Opacity(
        opacity: opacity,
        child: ClipRect(
          child: Transform.translate(
            offset: Offset(xOffest, 0),
            child: up.SearchBar(),
          ),
        ),
      ),
    );
  }

  @override
  double get minExtent => extent;

  @override
  double get maxExtent => extent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class SliverPersistentSearchBar extends SliverPersistentHeader {
  SliverPersistentSearchBar({
    Function(String)? onSearch,
    EdgeInsets? padding,
  }) : super(
          delegate: _SliverPersistentSearchBarDelegate(
            onSearch: onSearch,
            padding: padding,
          ),
          floating: true,
        );
}
