import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'cover_animated_dots.dart';

enum CoverAnimation {
  none,
  up,
  down,
}

class CoverController extends ChangeNotifier {
  static const fallbackArtwork = AssetImage("assets/artwork_not_found.jpg");
  static const endAnimationDuration =
      AnimatedDotsController.resetAnimationDuration;

  CoverController({
    required this.onNext,
    required this.onPrev,
    required up.Song song,
    required up.Song? prevSong,
    required up.Song? nextSong,
    required TickerProvider vsync,
    this.triggerThreshold = 0.1,
    this.dragSensibility = 0.01,
  })  : artworkAnimation = AnimationController(
          value: 0.5,
          duration: const Duration(milliseconds: 300),
          vsync: vsync,
        ),
        dotsController = AnimatedDotsController(
          showPrev: prevSong != null,
          showNext: nextSong != null,
        ),
        _song = song,
        _prevSong = prevSong,
        _nextSong = nextSong;

  up.Song _song;
  up.Song? _prevSong;
  up.Song? _nextSong;
  final double triggerThreshold;
  final double dragSensibility;
  final AnimationController artworkAnimation;
  final AnimatedDotsController dotsController;
  final Future<void> Function() onNext;
  final Future<void> Function() onPrev;
  double dragValue = 0.5;

  ImageProvider<Object> get artwork {
    if (_song.artwork != null) {
      return MemoryImage(_song.artwork!);
    }
    return fallbackArtwork;
  }

  ImageProvider<Object>? get prevArtwork {
    if (_prevSong == null) {
      return null;
    }
    if (_prevSong!.artwork != null) {
      return MemoryImage(_prevSong!.artwork!);
    }
    return fallbackArtwork;
  }

  ImageProvider<Object>? get nextArtwork {
    if (_nextSong == null) {
      return null;
    }
    if (_nextSong!.artwork != null) {
      return MemoryImage(_nextSong!.artwork!);
    }
    return fallbackArtwork;
  }

  ///Animate cover to display new song.
  ///setSongs will return after animation terminate
  ///if CoverAnimation.up and prevSong is null, hide the upper dot
  ///if CoverAnimation.down and nextSong is null, hide the lower dot
  Future<void> setSongs(
    up.Song song,
    CoverAnimation animate, {
    up.Song? prevSong,
    up.Song? nextSong,
  }) async {
    switch (animate) {
      case CoverAnimation.none:
        await _updateUpDownVisibility(
          prevSong: prevSong,
          nextSong: nextSong,
        );
        break;
      case CoverAnimation.up:
        await animateUp(hideUp: prevSong == null);
        break;
      case CoverAnimation.down:
        await animateDown(hideDown: nextSong == null);
        break;
    }
    _changeSongs(
      song,
      prevSong: prevSong,
      nextSong: nextSong,
    );
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
    if (dragValue < triggerThreshold && _prevSong != null) {
      onPrev();
    } else if (dragValue > 1 - triggerThreshold && _nextSong != null) {
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

  Future<void> _updateUpDownVisibility({
    required up.Song? prevSong,
    required up.Song? nextSong,
  }) async {
    if (_prevSong == null && prevSong != null) {
      dotsController.showUp();
    } else if (_prevSong != null && prevSong == null) {
      dotsController.hideUp();
    }
    if (_nextSong == null && nextSong != null) {
      dotsController.showDown();
    } else if (_nextSong != null && nextSong == null) {
      dotsController.hideDown();
    }
  }

  void _changeSongs(
    up.Song song, {
    up.Song? nextSong,
    up.Song? prevSong,
  }) {
    _song = song;
    _nextSong = nextSong;
    _prevSong = prevSong;
    notifyListeners();
  }

  void _reset() {
    artworkAnimation.value = 0.5;
  }
}
