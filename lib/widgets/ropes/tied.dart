import 'dart:math';

import 'package:flutter/material.dart';
import 'rope.dart';

class Tied extends StatefulWidget {
  const Tied({
    required this.child,
    required this.random,
    this.minAngle = -0.075,
    this.maxAngle = 0.075,
    this.maxRopeWidth = 30,
    this.maxRopeHeight = 20,
    this.holeSize = 8,
    Key? key,
  })  : assert(maxRopeWidth - (holeSize * 2) > 0),
        assert(maxRopeHeight - (holeSize * 2) > 0),
        super(key: key);

  final Random random;
  final double minAngle;
  final double maxAngle;
  final double maxRopeWidth;
  final double maxRopeHeight;
  final Widget child;
  final double holeSize;

  @override
  _TiedState createState() => _TiedState();
}

class _TiedState extends State<Tied> {
  _TiedState();

  @override
  void initState() {
    _rotation = widget.minAngle +
        (widget.random.nextDouble() * (widget.maxAngle - widget.minAngle));

    const minRopeOrientation = 0.5;
    const maxRopeOrientation = 0.7;
    _ropeOrientation = minRopeOrientation +
        (widget.random.nextDouble() *
            (maxRopeOrientation - minRopeOrientation));

    super.initState();
  }

  double _rotation = 0;

  double _ropeOrientation = 0.6;
  bool get _clockwiseRotation => _rotation > 0;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _rotation,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ((widget.maxRopeWidth - (widget.holeSize)) / 2),
            ),
            child: widget.child,
          ),
          // if (_clockwiseRotation)
          Positioned(
            top: 0,
            child: Rope(
              width: widget.maxRopeWidth,
              height: widget.maxRopeHeight,
              holeRadius: widget.holeSize / 2,
              startHoleOffset: Offset(0, _ropeOrientation),
              endHoleOffset: const Offset(1, 1),
              ropeWidth: 4,
              ropeBorderSize: 1,
            ),
          ),
          // if (_clockwiseRotation)
          //   Positioned(
          //     right: 0,
          //     bottom: 0,
          //     child: Rope(
          //       width: widget.maxRopeWidth,
          //       height: widget.maxRopeHeight,
          //       holeRadius: widget.holeSize / 2,
          //       ropeWidth: 4,
          //       ropeBorderSize: 1,
          //       startHoleOffset: const Offset(0, 0),
          //       endHoleOffset: Offset(1, 1 - _ropeOrientation),
          //     ),
          //   ),
          // if (!_clockwiseRotation)
          Positioned(
            top: 0,
            right: 0,
            child: Rope(
              width: widget.maxRopeWidth,
              height: widget.maxRopeHeight,
              holeRadius: widget.holeSize / 2,
              startHoleOffset: const Offset(0, 1),
              endHoleOffset: Offset(1, _ropeOrientation),
              ropeWidth: 4,
              ropeBorderSize: 1,
            ),
          ),
          // if (!_clockwiseRotation)
          //   Positioned(
          //     left: 0,
          //     bottom: 0,
          //     child: Rope(
          //       width: widget.maxRopeWidth,
          //       height: widget.maxRopeHeight,
          //       holeRadius: widget.holeSize / 2,
          //       ropeWidth: 4,
          //       ropeBorderSize: 1,
          //       startHoleOffset: Offset(0, 1 - _ropeOrientation),
          //       endHoleOffset: const Offset(1, 0),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
