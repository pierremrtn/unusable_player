import 'package:flutter/material.dart';
import 'package:unusable_player/theme/theme.dart';

class Page extends StatelessWidget {
  const Page({
    this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: AppDimensions.space2),
  });

  final Widget? child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
