import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class _SliverPersistentSearchBarDelegate
    extends SliverPersistentHeaderDelegate {
  const _SliverPersistentSearchBarDelegate({
    EdgeInsets? padding,
    Curve? curve,
    this.onSearch,
    this.onChanged,
  })  : padding = padding ?? EdgeInsets.zero,
        curve = curve ?? up.Feel.animationCurve;

  final EdgeInsets padding;
  final Curve curve;
  final ValueChanged<String>? onSearch;
  final ValueChanged<String>? onChanged;

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
    final xOffset = deviceWidth * (1 - normalizedVisibility);
    final opacity = 1 - (shrinkOffset / extent);

    return Container(
      padding: padding,
      color: context.colorScheme.surface,
      child: Opacity(
        opacity: opacity,
        child: ClipRect(
          child: Transform.translate(
            offset: Offset(xOffset, 0),
            child: up.SearchBar(
              onChanged: onChanged,
              onSearch: onSearch,
            ),
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
    Key? key,
    ValueChanged<String>? onSearch,
    ValueChanged<String>? onChanged,
    EdgeInsets? padding,
  }) : super(
          key: key,
          delegate: _SliverPersistentSearchBarDelegate(
            onSearch: onSearch,
            onChanged: onChanged,
            padding: padding,
          ),
          floating: true,
        );
}
