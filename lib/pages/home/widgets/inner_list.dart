import 'package:flutter/material.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

class InnerList extends StatelessWidget {
  const InnerList({
    required this.storageKey,
    required this.sliver,
  });

  final String storageKey;
  final Widget sliver;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: PageStorageKey<String>(storageKey),
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: EdgeInsets.all(up.Dimensions.pageMargin),
          sliver: sliver,
        ),
      ],
    );
  }
}
