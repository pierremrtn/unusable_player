import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:flutter/material.dart' as flt show ButtonStyle;
import 'package:unusable_player/theme/dimensions.dart';
import 'package:unusable_player/theme/theme.dart';
import 'package:unusable_player/widgets/widgets.dart';

enum ButtonStyle {
  primary,
  secondary,
  transparent,
}

class Button extends StatelessWidget {
  const Button._({
    required this.onPressed,
    this.icon,
    this.label,
    bool? round,
    ButtonStyle? style,
  })  : assert(icon != null || label != null),
        style = style ?? ButtonStyle.primary,
        round = round ?? false;

  factory Button({
    required VoidCallback onPressed,
    IconData? icon,
    String? label,
    ButtonStyle? style,
  }) =>
      Button._(
        onPressed: onPressed,
        icon: icon,
        label: label,
        round: false,
        style: style,
      );

  factory Button.round({
    required VoidCallback onPressed,
    IconData? icon,
    ButtonStyle? style,
  }) =>
      Button._(
        onPressed: onPressed,
        icon: icon,
        round: true,
        style: style,
      );

  final IconData? icon;
  final String? label;
  final VoidCallback onPressed;
  final bool round;
  final ButtonStyle style;

  MaterialStateProperty<OutlinedBorder>? get shape =>
      round ? MaterialStateProperty.all(CircleBorder()) : null;

  MaterialStateProperty<OutlinedBorder>? get padding =>
      round ? MaterialStateProperty.all(CircleBorder()) : null;

  MaterialStateProperty<Color>? backgroundColor(BuildContext context) {
    switch (style) {
      case ButtonStyle.secondary:
        return MaterialStateProperty.all(
          Theme.of(context).colorScheme.secondary,
        );
      case ButtonStyle.transparent:
        return MaterialStateProperty.all(
          Colors.transparent,
        );
      default:
        return null;
    }
  }

  MaterialStateProperty<Color>? splashColor(BuildContext context) {
    switch (style) {
      case ButtonStyle.transparent:
        return MaterialStateProperty.all(
          Theme.of(context).colorScheme.primary,
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: flt.ButtonStyle(
        shape: shape,
        backgroundColor: backgroundColor(context),
        overlayColor: splashColor(context),
      ),
      child: _buildInner(context),
    );
  }

  Widget _buildInner(BuildContext context) {
    final Widget? iconWidget = icon != null
        ? Icon(
            icon,
            size: AppDimensions.icon2,
          )
        : null;
    final Widget? textWidget = label != null
        ? Text(
            label!,
            style: Theme.of(context).textTheme.button,
          )
        : null;
    if (iconWidget != null && textWidget != null) {
      return Row(children: [
        iconWidget,
        const Space5(),
        textWidget,
      ]);
    } else {
      return iconWidget ?? textWidget!;
    }
  }

  static double get size => AppDimensions.icon2 + (AppDimensions.space4 * 2);
}
