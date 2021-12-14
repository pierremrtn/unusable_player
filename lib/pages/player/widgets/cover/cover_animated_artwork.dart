import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class CoverAnimatedArtwork extends StatelessWidget {
  CoverAnimatedArtwork({
    required this.artwork,
    required this.prevArtwork,
    required this.nextArtwork,
    required this.animation,
    required double triggerThreshold,
    double currentCardShift = 30,
    double prevCardShift = 30,
    double nextCardShift = 30,
    Key? key,
  })  : currentCardOpacity = AnimationMin(
          Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: animation,
              curve: const Interval(0, 0.5),
            ),
          ),
          Tween<double>(begin: 1, end: 0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(1 - triggerThreshold, 1),
            ),
          ),
        ),
        currentCardOffset = Tween<Offset>(
          begin: Offset(0, currentCardShift),
          end: Offset(0, -currentCardShift),
        ).animate(animation),

        //PREV CARD
        prevCardOpacity = Tween<double>(
          begin: 1,
          end: 0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.5),
          ),
        ),
        prevCardOffset = Tween<Offset>(
          begin: const Offset(0, 0),
          end: Offset(0, -prevCardShift),
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.5),
          ),
        ),

        //NEXT CARD
        nextCardOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.5, 1),
          ),
        ),
        nextCardOffset = Tween<Offset>(
          begin: Offset(0, nextCardShift),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.5, 1),
          ),
        ),
        super(key: key);

  final Uint8List? artwork;
  final Uint8List? prevArtwork;
  final Uint8List? nextArtwork;
  final AnimationController animation;
  final Animation<double> currentCardOpacity;
  final Animation<Offset> currentCardOffset;
  final Animation<double> prevCardOpacity;
  final Animation<Offset> prevCardOffset;
  final Animation<double> nextCardOpacity;
  final Animation<Offset> nextCardOffset;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, _) {
        return Stack(
          fit: StackFit.expand,
          children: [
            if (prevArtwork != null)
              Opacity(
                opacity: prevCardOpacity.value,
                child: Transform.translate(
                  transformHitTests: false,
                  offset: prevCardOffset.value,
                  child: up.DoubleBottomCard(
                    padding: const EdgeInsets.all(up.Dimensions.space5),
                    child: up.Image(
                      MemoryImage(prevArtwork!),
                      height: up.Dimensions.image1,
                      radius: up.Dimensions.borderRadius2,
                    ),
                  ),
                ),
              ),
            Opacity(
              opacity: currentCardOpacity.value,
              child: Transform.translate(
                transformHitTests: false,
                offset: currentCardOffset.value,
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
            ),
            if (nextArtwork != null)
              Opacity(
                opacity: nextCardOpacity.value,
                child: Transform.translate(
                  transformHitTests: false,
                  offset: nextCardOffset.value,
                  child: up.DoubleBottomCard(
                    padding: const EdgeInsets.all(up.Dimensions.space5),
                    child: up.Image(
                      MemoryImage(nextArtwork!),
                      height: up.Dimensions.image1,
                      radius: up.Dimensions.borderRadius2,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
