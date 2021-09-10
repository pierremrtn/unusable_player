import 'package:flutter/material.dart';
import 'package:unusable_player/theme/dimensions.dart';

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
        size.height,
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
    this.padding = AppDimensions.space1,
    this.bottomColor = Colors.transparent,
    this.bottomHeight = AppDimensions.space5,
    this.bottomHorizontalPadding = AppDimensions.space4,
    this.bottomRadius = AppDimensions.borderRadius,
  });

  final Widget? child;
  final Color bottomColor;
  final double padding;
  final double bottomHeight;
  final double bottomHorizontalPadding;
  final double bottomRadius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DoubleBorderPainter(
        color: bottomColor,
        borderColor: Theme.of(context).colorScheme.onSurface,
        borderWidth: AppDimensions.borderSize,
        height: bottomHeight,
        radius: bottomRadius,
        horizontalPadding: bottomHorizontalPadding,
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: bottomHeight),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface,
            width: AppDimensions.borderSize,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        ),
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}