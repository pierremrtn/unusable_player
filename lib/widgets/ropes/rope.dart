import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class _RopePainter extends CustomPainter {
  const _RopePainter({
    required this.holeColor,
    required this.ropeColor,
    required this.ropeBorderColor,
    required this.holeRadius,
    required this.ropeWidth,
    required this.ropeBorderSize,
    required this.startHoleOffset,
    required this.endHoleOffset,
  });

  final Color holeColor;
  final Color ropeColor;
  final Color ropeBorderColor;
  final double holeRadius;
  final double ropeWidth;
  final double ropeBorderSize;
  final Offset startHoleOffset;
  final Offset endHoleOffset;

  @override
  void paint(Canvas canvas, Size size) {
    final holePaint = Paint()..color = holeColor;
    final widthMinusHole = size.width - (holeRadius * 2);
    final heightMinusHole = size.height - (holeRadius * 2);
    final leftHoleCenter = Offset(
      (startHoleOffset.dx * widthMinusHole) + holeRadius,
      (startHoleOffset.dy * heightMinusHole) + holeRadius,
    );
    final rightHoleCenter = Offset(
      (endHoleOffset.dx * widthMinusHole) + holeRadius,
      (endHoleOffset.dy * heightMinusHole) + holeRadius,
    );
    canvas.drawCircle(
      leftHoleCenter,
      holeRadius,
      holePaint,
    );
    canvas.drawCircle(
      rightHoleCenter,
      holeRadius,
      holePaint,
    );
    canvas.drawLine(
        leftHoleCenter,
        rightHoleCenter,
        Paint()
          ..color = ropeBorderColor
          ..strokeWidth = ropeWidth
          ..strokeCap = StrokeCap.round);
    canvas.drawLine(
      leftHoleCenter,
      rightHoleCenter,
      Paint()
        ..color = ropeColor
        ..strokeWidth = ropeWidth - ropeBorderSize
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_RopePainter oldDelegate) {
    return true;
  }
}

class Rope extends StatelessWidget {
  const Rope({
    required this.width,
    required this.height,
    required this.holeRadius,
    required this.ropeWidth,
    required this.ropeBorderSize,
    this.startHoleOffset = const Offset(0, 0),
    this.endHoleOffset = const Offset(1, 1),
    Key? key,
  })  : assert(startHoleOffset >= Offset.zero &&
            startHoleOffset <= const Offset(1, 1)),
        assert(endHoleOffset >= Offset.zero &&
            endHoleOffset <= const Offset(1, 1)),
        super(key: key);

  final double width;
  final double height;
  final double holeRadius;
  final double ropeWidth;
  final double ropeBorderSize;
  final Offset startHoleOffset;
  final Offset endHoleOffset;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _RopePainter(
        holeColor: context.colorScheme.onSurface,
        ropeColor: context.colorScheme.surface,
        ropeBorderColor: context.colorScheme.onSurface,
        holeRadius: holeRadius,
        ropeWidth: ropeWidth,
        ropeBorderSize: ropeBorderSize,
        startHoleOffset: startHoleOffset,
        endHoleOffset: endHoleOffset,
      ),
    );
  }
}
