import 'dart:typed_data';
import 'dart:math';
import 'package:vector_math/vector_math_64.dart';

import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'transformed_artwork.dart';

class CoverAnimatedArtwork extends StatelessWidget {
  static const fallbackArtwork = AssetImage("assets/artwork_not_found.jpg");

  CoverAnimatedArtwork({
    required this.song,
    required this.prevSong,
    required this.nextSong,
    required this.animation,
    required double triggerThreshold,
    required double currentRotation,
    required double prevRotation,
    required double nextRotation,
    double verticalShift = 75,
    double scaleShift = 0.1,
    double maxRotationShift = 0.3,
    Curve curve = Curves.easeInOut,
    Key? key,
  })  : currentOpacity = AnimationMin(
          Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(0, triggerThreshold, curve: curve),
            ),
          ),
          Tween<double>(begin: 1, end: 0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(1 - triggerThreshold, 1, curve: curve),
            ),
          ),
        ),
        currentOffset = Tween<Offset>(
          begin: Offset(0, verticalShift),
          end: Offset(0, -verticalShift),
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(0, 1, curve: curve),
          ),
        ),
        currentScale = Tween<double>(
          begin: 1 + scaleShift,
          end: 1 - scaleShift,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(0, 1, curve: curve),
          ),
        ),
        currentRotation = Tween<double>(
          begin: currentRotation * maxRotationShift,
          end: -currentRotation * maxRotationShift,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(0, 1, curve: curve),
          ),
        ),

        //PREV CARD
        prevOpacity = Tween<double>(
          begin: 1,
          end: 0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(triggerThreshold, 0.5, curve: curve),
          ),
        ),
        prevOffset = Tween<Offset>(
          begin: const Offset(0, 0),
          end: Offset(0, -verticalShift),
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(0, 0.5, curve: curve),
          ),
        ),
        prevScale = Tween<double>(
          begin: 1,
          end: 1 - scaleShift,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(0, 0.5, curve: curve),
          ),
        ),
        prevRotation = Tween<double>(
          begin: 0,
          end: prevRotation * maxRotationShift,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(0, 0.5, curve: curve),
          ),
        ),

        //NEXT CARD
        nextOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(0.5, 1 - triggerThreshold, curve: curve),
          ),
        ),
        nextOffset = Tween<Offset>(
          begin: Offset(0, verticalShift),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(0.5, 1, curve: curve),
          ),
        ),
        nextScale = Tween<double>(
          begin: 1 + scaleShift,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(0.5, 1, curve: curve),
          ),
        ),
        nextRotation = Tween<double>(
          begin: nextRotation * maxRotationShift,
          end: 0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(0.5, 1, curve: curve),
          ),
        ),
        super(key: key);

  final up.Song song;
  final up.Song? prevSong;
  final up.Song? nextSong;

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
    final prev = _buildArtworkWidget(prevSong);
    final current = _buildArtworkWidget(song);
    final next = _buildArtworkWidget(nextSong);

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, _) {
        return Stack(
          fit: StackFit.expand,
          children: [
            if (prev != null)
              TransformedArtwork(
                artwork: prev,
                offset: prevOffset.value,
                rotation: prevRotation.value,
                scale: prevScale.value,
                opacity: prevOpacity.value,
              ),
            if (current != null)
              TransformedArtwork(
                artwork: current,
                offset: currentOffset.value,
                rotation: currentRotation.value,
                scale: currentScale.value,
                opacity: currentOpacity.value,
              ),
            if (next != null)
              TransformedArtwork(
                artwork: next,
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

  Widget? _buildArtworkWidget(up.Song? song) {
    if (song == null) return null;
    return up.DoubleBottomCard(
      bottomColor: song.artwork?.dominantColor,
      padding: const EdgeInsets.all(up.Dimensions.space5),
      child: up.Image(
        song.artwork?.image ?? fallbackArtwork,
        height: up.Dimensions.image1,
        radius: up.Dimensions.borderRadius2,
      ),
    );
  }
}
