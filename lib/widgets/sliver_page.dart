import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unusable_player/theme/theme.dart' as up;

class SliverPage extends StatelessWidget {
  const SliverPage({
    this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: up.Dimensions.space2),
    this.appBar,
    required this.slivers,
  });

  final Widget? child;
  final EdgeInsetsGeometry padding;
  final SliverAppBar? appBar;
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      body: Padding(
        padding: padding,
        child: CustomScrollView(
          slivers: [
            if (appBar != null) appBar!,
            ...slivers,
          ],
        ),
      ),
    );
  }
}
