import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unusable_player/theme/theme.dart' as up;

class Page extends StatelessWidget {
  const Page({
    Key? key,
    this.scrollable = true,
    EdgeInsetsGeometry? padding,
    this.appBar,
    this.body,
  })  : padding = padding ??
            (scrollable
                ? const up.PaddingPage(up.left | up.top | up.right)
                : const up.PaddingPage.all()),
        super(key: key);

  final bool scrollable;
  final EdgeInsetsGeometry padding;
  final PreferredSizeWidget? appBar;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBody: true,
      backgroundColor: Get.theme.colorScheme.background,
      body: scrollable
          ? SingleChildScrollView(
              padding: padding,
              child: body,
            )
          : Padding(
              padding: padding,
              child: body,
            ),
    );
  }
}
