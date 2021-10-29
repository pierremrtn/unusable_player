import 'package:flutter/material.dart';
import 'package:unusable_player/theme/theme.dart' as up;

class HomeInnerList extends StatelessWidget {
  const HomeInnerList({
    this.storageKey,
    required this.sliver,
    Key? key,
  }) : super(key: key);

  final String? storageKey;
  final Widget sliver;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: storageKey != null ? PageStorageKey<String>(storageKey!) : null,
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(up.Dimensions.pageMargin),
          sliver: sliver,
        ),
      ],
    );
  }
}
