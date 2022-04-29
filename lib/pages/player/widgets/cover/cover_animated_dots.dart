import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class AnimatedDotsController {
  static const resetAnimationDuration = Duration(milliseconds: 400);

  AnimatedDotsController({
    required this.showPrev,
    required this.showNext,
    this.dragSensibility = 0.01,
  });

  final bool showPrev;
  final bool showNext;
  final double dragSensibility;
  late SMIInput<double>? _vertical;
  late SMIInput<bool>? _pressed;
  late SMIInput<bool>? _initHidePrev;
  late SMIInput<bool>? _initHideNext;
  late SMITrigger? _goDown;
  late SMITrigger? _goDownLast;
  late SMITrigger? _goUp;
  late SMITrigger? _goUpLast;
  late SMITrigger? _cancel;
  late SMITrigger? _showUp;
  late SMITrigger? _hideUp;
  late SMITrigger? _showDown;
  late SMITrigger? _hideDown;

  void riveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      'main',
    );
    artboard.addController(controller!);
    _vertical = controller.findInput<double>('vertical');
    _goDown = controller.findInput<bool>('goDown') as SMITrigger;
    _goDownLast = controller.findInput<bool>('goDownLast') as SMITrigger;
    _goUp = controller.findInput<bool>('goUp') as SMITrigger;
    _goUpLast = controller.findInput<bool>('goUpLast') as SMITrigger;
    _pressed = controller.findInput<bool>('pressed');
    _initHidePrev = controller.findInput<bool>('initHidePrev');
    _initHideNext = controller.findInput<bool>('initHideNext');
    _showUp = controller.findInput<bool>('showUp') as SMITrigger;
    _hideUp = controller.findInput<bool>('hideUp') as SMITrigger;
    _showDown = controller.findInput<bool>('showDown') as SMITrigger;
    _hideDown = controller.findInput<bool>('hideDown') as SMITrigger;
    _initHidePrev?.value = !showPrev;
    _initHideNext?.value = !showNext;
  }

  void onDrag(double value) {
    _pressed?.value = true;
    _vertical?.value = value;
  }

  Future<void> cancel() async {
    _pressed?.value = false;
    return _resetAnimDelayed();
  }

  Future<void> goPrev({bool last = false}) async {
    if (last) {
      _goUpLast?.fire();
    } else {
      _goUp?.fire();
    }
    return _resetAnimDelayed();
  }

  Future<void> goNext({bool last = false}) async {
    if (last) {
      _goDownLast?.fire();
    } else {
      _goDown?.fire();
    }
    return _resetAnimDelayed();
  }

  void showUp() => _showUp?.fire();
  void hideUp() => _hideUp?.fire();
  void showDown() => _showDown?.fire();
  void hideDown() => _hideDown?.fire();

  Future<void> _resetAnimDelayed() async {
    return Future.delayed(resetAnimationDuration, _resetAnim);
  }

  void _resetAnim() {
    _pressed?.value = false;
    _vertical?.value = 0.5;
  }
}

class CoverAnimatedDots extends StatelessWidget {
  const CoverAnimatedDots({
    required this.width,
    required this.height,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final AnimatedDotsController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RiveAnimation.asset(
        Get.isDarkMode == true
            ? 'assets/rive/dark_cover_prev_next_indicator.riv'
            : 'assets/rive/cover_prev_next_indicator.riv',
        stateMachines: ['main'],
        alignment: Alignment.center,
        fit: BoxFit.fitWidth,
        onInit: controller.riveInit,
      ),
    );
  }
}
