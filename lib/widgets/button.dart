import 'package:flutter/material.dart';
import 'package:unusable_player/theme/dimensions.dart';
import 'package:unusable_player/theme/theme.dart';
import 'package:unusable_player/widgets/widgets.dart';

enum _Style {
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
    _Style? style,
  })  : assert(icon != null || label != null),
        style = style ?? _Style.primary,
        round = round ?? false;

  factory Button.primary({
    required VoidCallback onPressed,
    IconData? icon,
    String? label,
    bool? round,
  }) =>
      Button._(
        onPressed: onPressed,
        icon: icon,
        label: label,
        round: round,
        style: _Style.primary,
      );

  factory Button.secondary({
    required VoidCallback onPressed,
    IconData? icon,
    String? label,
    bool? round,
  }) =>
      Button._(
        onPressed: onPressed,
        icon: icon,
        label: label,
        round: round,
        style: _Style.secondary,
      );

  factory Button.transparent({
    required VoidCallback onPressed,
    IconData? icon,
    String? label,
    bool? round,
  }) =>
      Button._(
        onPressed: onPressed,
        icon: icon,
        label: label,
        round: round,
        style: _Style.transparent,
      );

  final IconData? icon;
  final String? label;
  final VoidCallback onPressed;
  final bool round;
  final _Style style;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: _buildButtonStyle(context),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.space5),
        child: _buildInner(context),
      ),
    );
  }

  ButtonStyle? _buildButtonStyle(BuildContext context) {
    switch (style) {
      case _Style.primary:
        return null;
      case _Style.secondary:
        return ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.secondary,
          ),
        );
      case _Style.transparent:
        return ButtonStyle(
          overlayColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.primary,
          ),
          backgroundColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
        );
    }
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
}
