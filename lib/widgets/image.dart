import 'package:flutter/material.dart' hide Image;
import 'package:flutter/material.dart' as flutter show Image;
import 'package:unusable_player/theme/dimensions.dart';
import 'package:unusable_player/theme/theme.dart';

class Image extends StatelessWidget {
  const Image.s1(this.image)
      : size = AppDimensions.image1,
        radius = AppDimensions.borderRadius1;

  const Image.s2(this.image)
      : size = AppDimensions.image2,
        radius = AppDimensions.borderRadius2;

  const Image.s3(this.image)
      : size = AppDimensions.image3,
        radius = AppDimensions.borderRadius3;

  final ImageProvider<Object> image;
  final Size size;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return flutter.Image(
      fit: BoxFit.cover,
      image: image,
      width: size.width,
      height: size.height,
      frameBuilder: (context, child, _, __) => radius != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(radius!),
              child: child,
            )
          : child,
    );
  }
}
