import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CoverAnimatedDots extends StatelessWidget {
  const CoverAnimatedDots({
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;

  void _onRiveInit(_) {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RiveAnimation.asset(
        'assets/rive/cover_prev_next_indicator.riv',
        stateMachines: ['main'],
        alignment: Alignment.center,
        fit: BoxFit.fitWidth,
        onInit: _onRiveInit,
      ),
    );
  }
}
