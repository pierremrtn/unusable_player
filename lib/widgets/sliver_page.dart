import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unusable_player/theme/theme.dart' as up;

class SliverPage extends StatelessWidget {
  const SliverPage({
    this.appBar,
    this.padding = const EdgeInsets.symmetric(
      horizontal: up.Dimensions.pageMargin,
    ),
    required this.slivers,
  });

  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry padding;
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: Get.theme.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: CustomScrollView(
            slivers: [
              ...slivers,
            ],
          ),
        ),
      ),
    );
  }
}
