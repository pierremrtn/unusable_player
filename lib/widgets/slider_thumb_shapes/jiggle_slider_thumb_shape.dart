import 'dart:math';

import 'package:flutter/material.dart';

class JiggleSliderThumbShape extends SliderComponentShape {
  /// This class MUST be instantiated once for each slider
  /// that use it, otherwise it will not works properly
  JiggleSliderThumbShape({
    // this.width = 6,
    // this.height = 8,
    // this.pressedWidth = 6,
    // this.pressedHeight = 13,
    // this.maxDragDistance = 3,
    this.width = 6,
    this.height = 8,
    this.pressedWidth = 6,
    this.pressedHeight = 21,
    this.maxDragDistance = 13,
  });

  ///minimum width of the thumb
  final double width;

  ///minimum height of the thumb
  final double height;

  ///width of the thumb when slider is pressed
  final double pressedWidth;

  ///height of the thumb when slider is pressed
  final double pressedHeight;

  final double maxDragDistance;

  Offset? lastCenter;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return isEnabled == true
        ? Size(pressedWidth, pressedHeight)
        : Size(width, height);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    assert(context != null);
    assert(center != null);
    assert(enableAnimation != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);

    final Canvas canvas = context.canvas;
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );

    final Color color = colorTween.evaluate(enableAnimation)!;
    final Tween<double> widthTween = Tween<double>(
      begin: width,
      end: pressedWidth,
    );
    final Tween<double> heightTween = Tween<double>(
      begin: height,
      end: pressedHeight,
    );

    final double drag = (lastCenter?.dx ?? center.dx) - center.dx;

    final double evaluatedWidth = widthTween.evaluate(activationAnimation);
    final double evaluatedHeight = heightTween.evaluate(activationAnimation);
    final double dragClamped = drag.clamp(-maxDragDistance, maxDragDistance);

    final path = Path()
      ..moveTo(center.dx + dragClamped, center.dy - evaluatedHeight / 2)
      ..quadraticBezierTo(
        center.dx - (dragClamped / 3),
        center.dy - (evaluatedHeight / 4),
        center.dx,
        center.dy,
      )
      ..quadraticBezierTo(
        center.dx - (dragClamped / 3),
        center.dy + (evaluatedHeight / 4),
        center.dx + dragClamped,
        center.dy + evaluatedHeight / 2,
      );

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round
        ..strokeWidth = evaluatedWidth,
    );

    // canvas.drawRRect(
    //     RRect.fromRectAndRadius(
    //       Rect.fromCenter(
    //         center: center,
    //         width: width,
    //         height: evaluatedHeight,
    //       ),
    //       Radius.circular(borderRadius),
    //     ),
    //     Paint()..color = color);

    lastCenter = center;
  }
}
