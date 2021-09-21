import 'package:flutter/material.dart' hide Image;
import 'package:flutter/material.dart' as flutter show Image;

import 'package:unusable_player/theme/theme.dart' as up;

class Image extends StatelessWidget {
  const Image.s1(this.image)
      : size = up.Dimensions.image1,
        radius = up.Dimensions.borderRadius1;

  const Image.s2(this.image)
      : size = up.Dimensions.image2,
        radius = up.Dimensions.borderRadius2;

  const Image.s3(this.image)
      : size = up.Dimensions.image3,
        radius = up.Dimensions.borderRadius3;

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
