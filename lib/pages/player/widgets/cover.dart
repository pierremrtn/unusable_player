import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/pages/player/widgets/cover_animated_artwork.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'cover_animated_dots.dart';

class CoverController {
  static const endAnimationDuration =
      AnimatedDotsController.resetAnimationDuration;

  CoverController({
    required this.onNext,
    required this.onPrev,
    required TickerProvider vsync,
    required bool showPrevAtInit,
    required bool showNextAtInit,
    this.triggerThreshold = 0.1,
    this.dragSensibility = 0.01,
  })  : artworkAnimation = AnimationController(
          value: 0.5,
          duration: const Duration(milliseconds: 300),
          vsync: vsync,
        ),
        dotsController = AnimatedDotsController(
          showPrev: showPrevAtInit,
          showNext: showNextAtInit,
        );

  final double triggerThreshold;
  final double dragSensibility;
  final AnimationController artworkAnimation;
  final AnimatedDotsController dotsController;
  final Future<void> Function() onNext;
  final Future<void> Function() onPrev;
  double dragValue = 0.5;

  void verticalDragStartHandle(DragStartDetails drag) {
    dragValue = 0.5;
  }

  void verticalDragHandle(DragUpdateDetails drag) {
    final deltaY = drag.primaryDelta!;
    dragValue = (dragValue + (deltaY * dragSensibility)).clamp(0, 1);
    dotsController.onDrag(dragValue);
    artworkAnimation.value =
        lerpDouble(triggerThreshold, 1 - triggerThreshold, dragValue)!;
  }

  Future<void> verticalDragEndHandle(DragEndDetails drag) async {
    if (dragValue < triggerThreshold) {
      onPrev();
    } else if (dragValue > 1 - triggerThreshold) {
      onNext();
    } else {
      cancel();
    }
    dragValue = 0.5;
  }

  Future<void> animateUp({bool hideUp = false}) async {
    artworkAnimation.animateTo(0, duration: endAnimationDuration);
    await dotsController.goPrev(last: hideUp);
    _reset();
  }

  Future<void> animateDown({bool hideDown = false}) async {
    artworkAnimation.animateTo(1, duration: endAnimationDuration);
    await dotsController.goNext(last: hideDown);
    _reset();
  }

  Future<void> cancel() async {
    artworkAnimation.animateTo(0.5, duration: endAnimationDuration);
    await dotsController.cancel();
    _reset();
  }

  void _reset() {
    artworkAnimation.value = 0.5;
  }
}

class Cover extends StatelessWidget {
  const Cover({
    required this.artwork,
    required this.nextArtwork,
    required this.prevArtwork,
    required this.controller,
    this.height = 189,
    Key? key,
  }) : super(key: key);

  final double height;
  final Uint8List? artwork;
  final Uint8List? nextArtwork;
  final Uint8List? prevArtwork;

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
              child: CoverAnimatedArtwork(
                triggerThreshold: controller.triggerThreshold,
                animation: controller.artworkAnimation,
                artwork: artwork,
                nextArtwork: nextArtwork,
                prevArtwork: prevArtwork,
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
