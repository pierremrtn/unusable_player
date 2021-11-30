import 'package:flutter/material.dart';

class RRectSliderThumbShape extends SliderComponentShape {
  /// Create a slider thumb that draws a circle.
  const RRectSliderThumbShape({
    this.width = 6,
    this.height = 6,
    this.pressedWidth = 8,
    this.pressedHeight = 13,
    this.borderRadius = 12,
  });

  ///minimum width of the thumb
  final double width;

  ///minimum height of the thumb
  final double height;

  ///width of the thumb when slider is pressed
  final double pressedWidth;

  ///height of the thumb when slider is pressed
  final double pressedHeight;

  final double borderRadius;

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

    final double evaluatedWidth = widthTween.evaluate(activationAnimation);
    final double evaluatedHeight = heightTween.evaluate(activationAnimation);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: center,
            width: evaluatedWidth,
            height: evaluatedHeight,
          ),
          Radius.circular(borderRadius),
        ),
        Paint()..color = color);
  }
}
