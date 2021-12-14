import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'cover_animated_dots.dart';

enum CoverAnimation {
  none,
  up,
  down,
}

class CoverController extends ChangeNotifier {
  static const endAnimationDuration =
      AnimatedDotsController.resetAnimationDuration;

  CoverController({
    required this.onNext,
    required this.onPrev,
    required Uint8List? artwork,
    required Uint8List? nextArtwork,
    required Uint8List? prevArtwork,
    required TickerProvider vsync,
    this.triggerThreshold = 0.1,
    this.dragSensibility = 0.01,
  })  : artworkAnimation = AnimationController(
          value: 0.5,
          duration: const Duration(milliseconds: 300),
          vsync: vsync,
        ),
        dotsController = AnimatedDotsController(
          showPrev: prevArtwork != null,
          showNext: nextArtwork != null,
        ),
        _artwork = artwork,
        _nextArtwork = nextArtwork,
        _prevArtwork = prevArtwork;

  Uint8List? _artwork;
  Uint8List? _nextArtwork;
  Uint8List? _prevArtwork;
  final double triggerThreshold;
  final double dragSensibility;
  final AnimationController artworkAnimation;
  final AnimatedDotsController dotsController;
  final Future<void> Function() onNext;
  final Future<void> Function() onPrev;
  double dragValue = 0.5;

  Uint8List? get artwork => _artwork;
  Uint8List? get nextArtwork => _nextArtwork;
  Uint8List? get prevArtwork => _prevArtwork;

  ///Animate cover to display new artworks.
  ///setArtworks will return after animation terminate
  ///if AnimateCover.up and prevArtwork is null, hide the upper dot
  ///if AnimateCover.down and nextArtwork is null, hide the lower dot
  Future<void> setArtworks(
    CoverAnimation animate, {
    Uint8List? artwork,
    Uint8List? prevArtwork,
    Uint8List? nextArtwork,
  }) async {
    switch (animate) {
      case CoverAnimation.none:
        return;
      case CoverAnimation.up:
        await animateUp(hideUp: prevArtwork == null);
        _changeArtworks(
          artwork: artwork,
          prevArtwork: prevArtwork,
          nextArtwork: nextArtwork,
        );
        return;
      case CoverAnimation.down:
        await animateDown(hideDown: nextArtwork == null);
        _changeArtworks(
          artwork: artwork,
          prevArtwork: prevArtwork,
          nextArtwork: nextArtwork,
        );
        return;
    }
  }

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
    if (dragValue < triggerThreshold && _prevArtwork != null) {
      onPrev();
    } else if (dragValue > 1 - triggerThreshold && _nextArtwork != null) {
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

  void _changeArtworks({
    Uint8List? artwork,
    Uint8List? nextArtwork,
    Uint8List? prevArtwork,
  }) {
    _artwork = artwork;
    _nextArtwork = nextArtwork;
    _prevArtwork = prevArtwork;
    notifyListeners();
  }

  void _reset() {
    artworkAnimation.value = 0.5;
  }
}
