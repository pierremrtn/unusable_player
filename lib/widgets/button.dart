import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:flutter/material.dart' as flutter show ButtonStyle;
import 'package:neat/neat.dart';
import 'package:unusable_player/unusable_player.dart' as up;

enum ButtonStyle {
  primary,
  secondary,
  transparent,
  icon,
}

class Button extends StatelessWidget {
  const Button._({
    this.onPressed,
    this.icon,
    this.label,
    this.padding,
    this.iconColor,
    bool? round,
    ButtonStyle? style,
    bool? enabled,
  })  : assert(icon != null || label != null),
        assert(style != ButtonStyle.icon || icon != null),
        style = style ?? ButtonStyle.primary,
        round = round ?? false,
        enabled = enabled ?? true;

  factory Button({
    VoidCallback? onPressed,
    IconData? icon,
    String? label,
    ButtonStyle? style,
    EdgeInsetsGeometry? padding,
    bool? enabled,
    Color? iconColor,
  }) =>
      Button._(
        onPressed: onPressed,
        icon: icon,
        label: label,
        round: false,
        style: style,
        padding: padding,
        enabled: enabled,
        iconColor: iconColor,
      );

  factory Button.round({
    VoidCallback? onPressed,
    IconData? icon,
    ButtonStyle? style,
    EdgeInsetsGeometry? padding,
    bool? enabled,
    Color? iconColor,
  }) =>
      Button._(
        onPressed: onPressed,
        icon: icon,
        round: true,
        style: style,
        padding: padding,
        enabled: enabled,
        iconColor: iconColor,
      );

  factory Button.icon(
    IconData icon, {
    VoidCallback? onPressed,
    EdgeInsetsGeometry? padding,
    bool? enabled,
    Color? color,
    Color? disabledColor,
  }) =>
      Button._(
        onPressed: onPressed,
        icon: icon,
        round: true,
        style: ButtonStyle.icon,
        padding: padding,
        enabled: enabled,
        iconColor:
            (enabled ?? true) || disabledColor == null ? color : disabledColor,
      );

  final Color? iconColor;
  final IconData? icon;
  final String? label;
  final VoidCallback? onPressed;
  final bool round;
  final EdgeInsetsGeometry? padding;
  final ButtonStyle style;
  final bool enabled;

  MaterialStateProperty<OutlinedBorder>? get shape =>
      round ? MaterialStateProperty.all(const CircleBorder()) : null;

  MaterialStateProperty<Color>? backgroundColor(BuildContext context) {
    switch (style) {
      case ButtonStyle.secondary:
        return MaterialStateProperty.all(
          context.colorScheme.secondary,
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
          context.colorScheme.primary,
        );
      default:
        return null;
    }
  }

  MaterialStateProperty<BorderSide>? get side {
    switch (style) {
      case ButtonStyle.icon:
        return MaterialStateProperty.all(BorderSide.none);
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (style == ButtonStyle.icon) {
      return Material(
        color: Colors.transparent,
        child: IconButton(
          iconSize: up.Dimensions.icon2,
          splashRadius: up.Dimensions.icon2,
          icon: _buildIcon(context),
          onPressed: enabled ? onPressed : null,
          splashColor: context.colorScheme.secondary,
        ),
      );
    }

    return OutlinedButton(
      onPressed: enabled ? onPressed : null,
      style: flutter.ButtonStyle(
        shape: shape,
        backgroundColor: backgroundColor(context),
        overlayColor: splashColor(context),
        side: side,
      ),
      child: _buildInner(context),
    );
  }

  Widget _buildInner(BuildContext context) {
    final Widget? iconWidget = icon != null ? _buildIcon(context) : null;
    final Widget? textWidget = label != null
        ? Text(
            label!,
            style: Theme.of(context).textTheme.button,
          )
        : null;
    Widget innerWidget;

    if (iconWidget != null && textWidget != null) {
      innerWidget = Row(children: [
        iconWidget,
        const up.Space5(),
        textWidget,
      ]);
    } else {
      innerWidget = iconWidget ?? textWidget!;
    }

    return padding != null
        ? Padding(padding: padding!, child: innerWidget)
        : innerWidget;
  }

  Widget _buildIcon(BuildContext context) {
    final color = iconColor ?? context.colorScheme.onSurface;
    return Icon(
      icon,
      size: up.Dimensions.icon2,
      color: enabled ? color : color.withOpacity(0.3),
    );
  }

  static double get size => up.Dimensions.icon2 + (up.Dimensions.space4 * 2);
}
