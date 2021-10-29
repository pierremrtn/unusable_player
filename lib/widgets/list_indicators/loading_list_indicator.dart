import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class LoadingListIndicator extends StatelessWidget {
  const LoadingListIndicator({
    Key? key,
    this.padding = const EdgeInsets.all(up.Dimensions.space1),
  }) : super(key: key);

  static Widget sliver({
    EdgeInsetsGeometry padding = const EdgeInsets.all(up.Dimensions.space1),
  }) {
    return SliverToBoxAdapter(
      child: LoadingListIndicator(
        padding: padding,
      ),
    );
  }

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: CircularProgressIndicator(
          backgroundColor: context.colorScheme.secondaryVariant,
        ),
      ),
    );
  }
}
