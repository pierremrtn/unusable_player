import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neat/generator.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'rope.dart';

enum _Direction {
  clockwise,
  counterClockwise,
}

final int _minAnimDurationMS = up.Feel.animationDuration.inMilliseconds;
final int _maxAnimDurationMS = up.Feel.animationDuration.inMilliseconds * 2;

class AlbumSwing extends StatefulWidget {
  final Key? key;
  final Widget child;
  final Duration duration;
  final Duration delay;
  final bool infinite;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double maxRotation;
  final _Direction direction;
  final Alignment rotationOrigin;
  final double _minRotation;
  final double _maxRotation;

  AlbumSwing({
    this.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.delay = const Duration(milliseconds: 0),
    this.infinite = false,
    this.controller,
    this.manualTrigger = false,
    this.animate = true,
    this.direction = _Direction.clockwise,
    this.maxRotation = 0.3,
    this.rotationOrigin = Alignment.topCenter,
  })  : _minRotation =
            direction == _Direction.clockwise ? maxRotation : -maxRotation,
        _maxRotation =
            direction == _Direction.clockwise ? -maxRotation : maxRotation,
        super(key: key) {
    if (manualTrigger == true && controller == null) {
      throw FlutterError('If you want to use manualTrigger:true, \n\n'
          'Then you must provide the controller property, that is a callback like:\n\n'
          ' ( controller: AnimationController) => yourController = controller \n\n');
    }
  }

  @override
  _SwingState createState() => _SwingState();
}

/// State class, where the magic happens
class _SwingState extends State<AlbumSwing>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  bool disposed = false;
  late Animation<double> animationRotation1;
  late Animation<double> animationRotation2;
  late Animation<double> animationRotation3;
  late Animation<double> animationRotationY;
  @override
  void dispose() {
    disposed = true;
    controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animationRotation1 =
        Tween<double>(begin: widget._maxRotation, end: widget._minRotation)
            .animate(CurvedAnimation(
                parent: controller!,
                curve: Interval(0, 0.4, curve: Curves.easeOut)));

    animationRotation2 =
        Tween<double>(begin: widget._minRotation, end: widget._maxRotation)
            .animate(CurvedAnimation(
                parent: controller!,
                curve: Interval(0.4, 0.75, curve: Curves.easeInOut)));

    animationRotation3 = Tween<double>(begin: widget._maxRotation, end: 0)
        .animate(CurvedAnimation(
            parent: controller!,
            curve: Interval(0.75, 1, curve: Curves.easeInOut)));

    animationRotationY = Tween<double>(begin: pi, end: 0).animate(
        CurvedAnimation(
            parent: controller!,
            curve: Interval(0, 0.75, curve: Curves.easeInOut)));

    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        if (!disposed) {
          (widget.infinite) ? controller!.repeat() : controller?.forward();
        }
      });
    }

    if (widget.controller is Function) {
      widget.controller!(controller!);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animate && widget.delay.inMilliseconds == 0) {
      controller?.forward();
    }

    return AnimatedBuilder(
        animation: controller!,
        builder: (BuildContext context, Widget? child) {
          double angle = (animationRotation1.value != widget._minRotation)
              ? animationRotation1.value
              : (animationRotation2.value != widget._maxRotation)
                  ? animationRotation2.value
                  : animationRotation3.value;

          return Transform(
            transform: Matrix4.rotationX(animationRotationY.value),
            alignment: Alignment.topCenter,
            child: Transform.rotate(
              alignment: widget.rotationOrigin,
              angle: angle,
              child: widget.child,
            ),
          );
        });
  }
}

class Suspended extends StatefulWidget {
  const Suspended({
    required this.child,
    required this.random,
    this.minAngle = -0.075,
    this.maxAngle = 0.075,
    this.maxRopeHeight = 30,
    this.maxRopeHorizontalShift = 60,
    this.maxXShift = 0.65,
    this.holeSize = 8,
    this.minSwingForce = 0.05,
    this.maxSwingForce = 0.15,
    Key? key,
  })  : assert(maxRopeHorizontalShift - (holeSize * 2) > 0),
        assert(maxRopeHeight - (holeSize * 2) > 0),
        super(key: key);

  final Random random;
  final double minAngle;
  final double maxAngle;
  final double maxRopeHorizontalShift;
  final double maxRopeHeight;
  final Widget child;
  final double holeSize;
  final double maxXShift;
  final double minSwingForce;
  final double maxSwingForce;

  @override
  _SuspendedState createState() => _SuspendedState();
}

class _SuspendedState extends State<Suspended> {
  _SuspendedState();

  @override
  void initState() {
    // final _randomValue = widget.random.nextDouble();
    _swingForce = widget.random.nextDouble();
    _rotation =
        widget.minAngle + (_swingForce * (widget.maxAngle - widget.minAngle));
    _ropeXAlign =
        -widget.maxXShift + ((1 - _swingForce) * (widget.maxXShift * 2));

    super.initState();
  }

  double _rotation = 0;
  double _ropeXAlign = 0;
  double _swingForce = 0;

  int get _animDuration =>
      ((_maxAnimDurationMS - _minAnimDurationMS) * _swingForce).toInt() +
      _minAnimDurationMS;

  double get rotationForce =>
      widget.minSwingForce +
      ((widget.maxSwingForce - widget.minSwingForce) * _swingForce);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: ((widget.maxRopeHeight - (widget.holeSize)) / 2),
          ),
          child: Transform.rotate(
            angle: _rotation,
            alignment: Alignment(_ropeXAlign, -0.8),
            child: AlbumSwing(
              duration: Duration(milliseconds: _animDuration),
              maxRotation: rotationForce,
              direction: _rotation > 0
                  ? _Direction.clockwise
                  : _Direction.counterClockwise,
              rotationOrigin: Alignment(_ropeXAlign, -0.8),
              child: widget.child,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment(_ropeXAlign, 0),
            child: Rope(
              width: widget.holeSize,
              height: widget.maxRopeHeight,
              holeRadius: widget.holeSize / 2,
              startHoleOffset: const Offset(0.5, 0),
              endHoleOffset: const Offset(0.5, 1),
              ropeWidth: 4,
              ropeBorderSize: 1,
            ),
          ),
        ),
      ],
    );
  }
}
