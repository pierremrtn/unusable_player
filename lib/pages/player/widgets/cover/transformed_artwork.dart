import 'package:vector_math/vector_math_64.dart';

import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class TransformedArtwork extends StatelessWidget {
  const TransformedArtwork({
    required this.artwork,
    required this.offset,
    required this.rotation,
    required this.scale,
    required this.opacity,
    Key? key,
  }) : super(key: key);

  final Widget artwork;
  final Offset offset;
  final double rotation;
  final double scale;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    final Matrix4 transform = Matrix4.compose(
      Vector3(
        offset.dx,
        offset.dy,
        0,
      ),
      Quaternion.axisAngle(Vector3(0, 0, 1), rotation),
      Vector3(
        scale,
        scale,
        1,
      ),
    );
    return Opacity(
      opacity: opacity,
      child: Transform(
        transform: transform,
        alignment: Alignment.center,
        child: artwork,
      ),
    );
  }
}
