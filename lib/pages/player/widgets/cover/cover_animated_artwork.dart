import 'dart:typed_data';
import 'dart:math';
import 'package:vector_math/vector_math_64.dart';

import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'transformed_artwork.dart';

class CoverAnimatedArtwork extends StatelessWidget {
  CoverAnimatedArtwork({
    required this.artwork,
    required this.prevArtwork,
    required this.nextArtwork,
    required this.animation,
    required double triggerThreshold,
    required double currentRotation,
    required double prevRotation,
    required double nextRotation,
    double verticalShift = 50,
    double scaleShift = 0.2,
    double maxRotationShift = 0.4,
    Key? key,
  })  : currentOpacity = AnimationMin(
          Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(0, triggerThreshold),
            ),
          ),
          Tween<double>(begin: 1, end: 0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(1 - triggerThreshold, 1),
            ),
          ),
        ),
        currentOffset = Tween<Offset>(
          begin: Offset(0, verticalShift),
          end: Offset(0, -verticalShift),
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 1),
          ),
        ),
        currentScale = Tween<double>(
          begin: 1 + scaleShift,
          end: 1 - scaleShift,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 1),
          ),
        ),
        currentRotation = Tween<double>(
          begin: currentRotation * maxRotationShift,
          end: -currentRotation * maxRotationShift,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 1),
          ),
        ),

        //PREV CARD
        prevOpacity = Tween<double>(
          begin: 1,
          end: 0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(triggerThreshold, 0.5),
          ),
        ),
        prevOffset = Tween<Offset>(
          begin: const Offset(0, 0),
          end: Offset(0, -verticalShift),
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.5),
          ),
        ),
        prevScale = Tween<double>(
          begin: 1,
          end: 1 - scaleShift,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.5),
          ),
        ),
        prevRotation = Tween<double>(
          begin: 0,
          end: prevRotation * maxRotationShift,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.5),
          ),
        ),

        //NEXT CARD
        nextOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(0.5, 1 - triggerThreshold),
          ),
        ),
        nextOffset = Tween<Offset>(
          begin: Offset(0, verticalShift),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.5, 1),
          ),
        ),
        nextScale = Tween<double>(
          begin: 1 + scaleShift,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.5, 1),
          ),
        ),
        nextRotation = Tween<double>(
          begin: nextRotation * maxRotationShift,
          end: 0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.5, 1),
          ),
        ),
        super(key: key);

  final ImageProvider<Object> artwork;
  final ImageProvider<Object>? prevArtwork;
  final ImageProvider<Object>? nextArtwork;

  final AnimationController animation;

  final Animation<double> currentOpacity;
  final Animation<Offset> currentOffset;
  final Animation<double> currentScale;
  final Animation<double> currentRotation;

  final Animation<double> prevOpacity;
  final Animation<Offset> prevOffset;
  final Animation<double> prevScale;
  final Animation<double> prevRotation;

  final Animation<double> nextOpacity;
  final Animation<Offset> nextOffset;
  final Animation<double> nextScale;
  final Animation<double> nextRotation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, _) {
        return Stack(
          fit: StackFit.expand,
          children: [
            if (prevArtwork != null)
              TransformedArtwork(
                artwork: prevArtwork!,
                offset: prevOffset.value,
                rotation: prevRotation.value,
                scale: prevScale.value,
                opacity: prevOpacity.value,
              ),
            TransformedArtwork(
              artwork: artwork,
              offset: currentOffset.value,
              rotation: currentRotation.value,
              scale: currentScale.value,
              opacity: currentOpacity.value,
            ),
            if (nextArtwork != null)
              TransformedArtwork(
                artwork: nextArtwork!,
                offset: nextOffset.value,
                rotation: nextRotation.value,
                scale: nextScale.value,
                opacity: nextOpacity.value,
              ),
          ],
        );
      },
    );
  }
}
