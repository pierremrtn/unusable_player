import 'package:flutter/material.dart';
import 'package:unusable_player/theme/theme.dart' as up;

class _DoubleBorderPainter extends CustomPainter {
  const _DoubleBorderPainter({
    required this.color,
    required this.borderColor,
    required this.borderWidth,
    required this.height,
    required this.horizontalPadding,
    required this.radius,
  });

  final Color color;
  final Color borderColor;
  final double borderWidth;
  final double height;
  final double horizontalPadding;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        horizontalPadding,
        size.height / 2,
        size.width - (horizontalPadding),
        size.height,
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ),
      Paint()..color = color,
    );
    canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        horizontalPadding,
        size.height / 2,
        size.width - (horizontalPadding),
        size.height - borderWidth / 2,
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ),
      Paint()
        ..color = borderColor
        ..strokeWidth = borderWidth
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class DoubleBottomCard extends StatelessWidget {
  const DoubleBottomCard({
    this.child,
    this.height,
    this.width,
    this.padding = up.Dimensions.space1,
    this.backgroundColor,
    this.bottomColor = Colors.transparent,
    this.bottomHeight = up.Dimensions.space5,
    this.bottomHorizontalPadding = up.Dimensions.space4,
    this.borderRadius = up.Dimensions.borderRadius1,
  });

  final Widget? child;
  final double padding;

  final Color? backgroundColor;

  final double? height;
  final double? width;

  final Color bottomColor;
  final double bottomHeight;
  final double bottomHorizontalPadding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DoubleBorderPainter(
        color: bottomColor,
        borderColor: Theme.of(context).colorScheme.onSurface,
        borderWidth: up.Dimensions.borderSize,
        height: bottomHeight,
        radius: borderRadius,
        horizontalPadding: bottomHorizontalPadding,
      ),
      child: Container(
        height: height,
        width: width,
        margin: EdgeInsets.only(bottom: bottomHeight),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface,
            width: up.Dimensions.borderSize,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}
