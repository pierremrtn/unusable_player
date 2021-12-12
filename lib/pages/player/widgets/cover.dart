import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'cover_animated_dots.dart';

class CoverController {
  CoverController({
    required TickerProvider vsync,
    this.triggerThreshold = 0.3,
    this.dragSensibility = 0.01,
  })  : _animController = AnimationController(
          value: 0.5,
          duration: const Duration(milliseconds: 300),
          vsync: vsync,
        ),
        dotsController = AnimatedDotsController(
          showPrev: true,
          showNext: true,
        );

  final double triggerThreshold;
  final double dragSensibility;
  final AnimationController _animController;
  final AnimatedDotsController dotsController;

  void verticalDragStartHandle(DragStartDetails drag) {
    _animController.value = 0.5;
    dotsController.onDrag(0.5);
  }

  void verticalDragHandle(DragUpdateDetails drag) {
    final deltaY = drag.primaryDelta!;
    final currentValue = _animController.value;
    final newValue = currentValue + (deltaY * dragSensibility);
    dotsController.onDrag(newValue);
    _animController.value = newValue;
  }

  void verticalDragEndHandle(DragEndDetails drag) {
    final value = _animController.value;
    if (value < triggerThreshold) {
      dotsController.goPrev();
    } else if (value > 1 - triggerThreshold) {
      dotsController.goNext();
    } else {
      dotsController.cancel();
    }
    _animController.value = 0.5;
  }
}

class Cover extends StatelessWidget {
  const Cover({
    required this.artwork,
    required this.controller,
    this.height = 189,
    Key? key,
  }) : super(key: key);

  final double height;
  final Uint8List? artwork;
  final CoverController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: GestureDetector(
        onVerticalDragEnd: controller.verticalDragEndHandle,
        onVerticalDragUpdate: controller.verticalDragHandle,
        onVerticalDragStart: controller.verticalDragStartHandle,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const up.Space3(),
            Expanded(
              child: up.DoubleBottomCard(
                padding: const EdgeInsets.all(up.Dimensions.space5),
                child: up.Image(
                  artwork != null
                      ? MemoryImage(artwork!) as ImageProvider<Object>
                      : const AssetImage("assets/skeler.jpg"),
                  height: up.Dimensions.image1,
                  radius: up.Dimensions.borderRadius2,
                ),
              ),
            ),
            SizedBox(
              width: up.Dimensions.paddingPage + up.Dimensions.space4,
              child: Align(
                alignment: Alignment.center,
                child: CoverAnimatedDots(
                  height: height,
                  width: up.Dimensions.space4,
                  controller: controller.dotsController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
