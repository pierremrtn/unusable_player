import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'package:neat/neat.dart';

const double _kShadowRadius = 7;
const double _kShadowSpread = 2;
const double kPlayingSongIndicatorShadowSize = _kShadowRadius + _kShadowSpread;

const double kPlayingSongIndicatorHeight = 100;
const double _kContentHeight =
    kPlayingSongIndicatorHeight - (kPlayingSongIndicatorShadowSize * 2);

const double _kDragThreshold = 0.25;
const double _kSensibility = 0.002;

class PlayingSongIndicator extends StatefulWidget {
  const PlayingSongIndicator({
    required this.song,
    this.isPlaying = true,
    this.onPlay,
    this.onPause,
    this.onTap,
    this.onDrag,
    Key? key,
  }) : super(key: key);

  final up.Song song;
  final bool isPlaying;
  final VoidCallback? onPlay;
  final VoidCallback? onPause;
  final VoidCallback? onTap;
  final VoidCallback? onDrag;

  @override
  _PlayingSongIndicatorState createState() => _PlayingSongIndicatorState();
}

class _PlayingSongIndicatorState extends State<PlayingSongIndicator>
    with TickerProviderStateMixin {
  _PlayingSongIndicatorState();

  late AnimationController controller;
  late Animation<Offset> position;
  late Animation<double> opacity;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      value: 0.5,
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    position =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(1, 0))
            .animate(
      controller,
    );
    opacity = AnimationMin(
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0, 0.5)),
      ),
      Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.5, 1)),
      ),
    );
  }

  void _handleDrag(DragUpdateDetails details) {
    final delta = details.primaryDelta! * _kSensibility;
    final double animValue = (controller.value += delta).clamp(0, 1);
    controller.animateTo(animValue);
  }

  void _handleDragEnd(DragEndDetails details) {
    final value = controller.value;
    if (value < _kDragThreshold) {
      controller.animateTo(0);
      widget.onDrag?.call();
    } else if (value > 1 - _kDragThreshold) {
      controller.animateTo(1);
      widget.onDrag?.call();
    } else {
      controller.animateTo(0.5, duration: up.Feel.animationDuration);
    }
  }

  @override
  Widget build(BuildContext context) {
    final foregroundColor = Theme.of(context).colorScheme.surface;

    return GestureDetector(
      onHorizontalDragUpdate: _handleDrag,
      onHorizontalDragEnd: _handleDragEnd,
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, child) => Opacity(
          opacity: opacity.value,
          child: FractionalTranslation(
            translation: position.value,
            transformHitTests: false,
            child: child,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(up.Dimensions.borderRadius1),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.surface,
                blurRadius: _kShadowRadius,
                spreadRadius: _kShadowSpread,
                blurStyle: BlurStyle.normal,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(kPlayingSongIndicatorShadowSize),
            child: up.DoubleBottomCard(
              onTap: widget.onTap,
              padding: const up.Padding3.all(),
              backgroundColor: context.colorScheme.primary,
              bottomColor: context.colorScheme.surface,
              height: _kContentHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    up.Icons.cd,
                    color: foregroundColor,
                  ),
                  const up.Space4(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: context.bodyText1(
                            widget.song.artist.name,
                            style: TextStyle(color: foregroundColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: context.headline5(
                            widget.song.title,
                            style: TextStyle(color: foregroundColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const up.Space4(),
                  up.Button.icon(
                    widget.isPlaying ? up.Icons.pause : up.Icons.play,
                    onPressed:
                        widget.isPlaying ? widget.onPause : widget.onPlay,
                    color: foregroundColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
