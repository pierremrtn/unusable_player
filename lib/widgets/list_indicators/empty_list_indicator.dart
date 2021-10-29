import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/unusable_player.dart' as up;

const double _kLeftDisplacement = 6;
const double _kBottomDisplacement = 2;

class EmptyListIndicator extends StatelessWidget {
  const EmptyListIndicator({
    Key? key,
    this.message,
    this.padding = const EdgeInsets.all(up.Dimensions.space1),
  }) : super(key: key);

  static Widget sliver({
    String? message,
    EdgeInsetsGeometry padding = const EdgeInsets.all(up.Dimensions.space1),
  }) {
    return SliverToBoxAdapter(
      child: EmptyListIndicator(
        message: message,
        padding: padding,
      ),
    );
  }

  final String? message;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    up.Icons.search,
                    size: 60,
                    color: context.colorScheme.secondary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: _kBottomDisplacement,
                    right: _kLeftDisplacement,
                  ),
                  child: Icon(
                    up.Icons.search,
                    size: 60,
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const up.Space4(),
            context.bodyText2(
              message ?? "There is nothing here",
            ),
          ],
        ),
      ),
    );
  }
}
