import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class JigglingSlider extends StatefulWidget {
  const JigglingSlider({
    this.min = 0,
    this.max = 1,
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final double min;
  final double max;
  final double value;
  final ValueChanged<double>? onChanged;

  @override
  _JigglingSliderState createState() => _JigglingSliderState();
}

class _JigglingSliderState extends State<up.JigglingSlider> {
  final up.JiggleSliderThumbShape thumbShapeInstance =
      up.JiggleSliderThumbShape();

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        thumbShape: thumbShapeInstance,
      ),
      child: Slider(
        min: widget.min,
        max: widget.max,
        value: widget.value,
        onChanged: widget.onChanged,
      ),
    );
  }
}
