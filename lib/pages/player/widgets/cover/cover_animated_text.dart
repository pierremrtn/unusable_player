import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'package:unusable_player/unusable_player.dart' as up;
import 'cover_controller.dart';

class CoverAnimatedText extends StatelessWidget {
  CoverAnimatedText({
    required this.controller,
    final double textShift = 400,
    final Curve curve = Curves.easeInOutCubic,
    Key? key,
  })  : currentOpacity = AnimationMin(
          Tween<double>(
            begin: 0,
            end: 1,
          ).animate(
            CurvedAnimation(
              parent: controller.artworkAnimation,
              curve: Interval(
                0,
                controller.triggerThreshold,
                curve: curve,
              ),
            ),
          ),
          Tween<double>(
            begin: 1,
            end: 0,
          ).animate(
            CurvedAnimation(
              parent: controller.artworkAnimation,
              curve: Interval(
                1 - controller.triggerThreshold,
                1,
                curve: curve,
              ),
            ),
          ),
        ),
        currentPosition = _AnimationAdd(
          Tween<double>(
            begin: textShift,
            end: 0,
          ).animate(
            CurvedAnimation(
              parent: controller.artworkAnimation,
              curve: Interval(
                0,
                controller.triggerThreshold,
                curve: curve,
              ),
            ),
          ),
          Tween<double>(
            begin: 0,
            end: -textShift,
          ).animate(
            CurvedAnimation(
              parent: controller.artworkAnimation,
              curve: Interval(
                1 - controller.triggerThreshold,
                1,
                curve: curve,
              ),
            ),
          ),
        ),

        //PREV TEXT
        prevOpacity = Tween<double>(
          begin: 1,
          end: 0,
        ).animate(
          CurvedAnimation(
            parent: controller.artworkAnimation,
            curve: Interval(
              0,
              controller.triggerThreshold,
              curve: curve,
            ),
          ),
        ),
        prevPosition = Tween(
          begin: const Offset(0, 0),
          end: Offset(-textShift, 0),
        ).animate(
          CurvedAnimation(
            parent: controller.artworkAnimation,
            curve: Interval(
              0,
              controller.triggerThreshold,
              curve: curve,
            ),
          ),
        ),

        //NEXT TEXT
        nextOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller.artworkAnimation,
            curve: Interval(
              1 - controller.triggerThreshold,
              1,
              curve: curve,
            ),
          ),
        ),
        nextPosition = Tween(
          begin: Offset(textShift, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: controller.artworkAnimation,
            curve: Interval(
              1 - controller.triggerThreshold,
              1,
              curve: curve,
            ),
          ),
        ),
        super(key: key);

  final CoverController controller;
  final Animation<double> currentPosition;
  final Animation<double> currentOpacity;

  final Animation<Offset> prevPosition;
  final Animation<double> prevOpacity;

  final Animation<Offset> nextPosition;
  final Animation<double> nextOpacity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const up.PaddingPage.horizontal(),
      child: AnimatedBuilder(
        animation: controller.artworkAnimation,
        builder: (context, current) => Stack(
          children: [
            if (controller.prevSong != null)
              _SongInfos(
                opacity: prevOpacity.value,
                position: prevPosition.value,
                song: controller.prevSong!,
              ),
            _SongInfos(
              opacity: currentOpacity.value,
              position: Offset(currentPosition.value, 0),
              song: controller.currentSong,
            ),
            if (controller.nextSong != null)
              _SongInfos(
                opacity: nextOpacity.value,
                position: nextPosition.value,
                song: controller.nextSong!,
              ),
          ],
        ),
      ),
    );
  }
}

class _SongInfos extends StatelessWidget {
  const _SongInfos({
    required this.song,
    required this.opacity,
    required this.position,
    Key? key,
  }) : super(key: key);

  final up.Song song;
  final double opacity;
  final Offset position;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Transform.translate(
        offset: position,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            context.headline1(
              song.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            context.subtitle1(
              song.artist.name,
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimationAdd extends CompoundAnimation<double> {
  /// Creates an animation that tracks the mean of two other animations.
  _AnimationAdd(
    Animation<double> left,
    Animation<double> right,
  ) : super(first: left, next: right);

  @override
  double get value => (first.value + next.value);
}
