import 'package:flutter/material.dart' hide Image;
import 'package:flutter/material.dart' as flutter show Image;

import 'package:unusable_player/theme/theme.dart' as up;

class Image extends StatelessWidget {
  const Image(
    this.image, {
    this.width,
    this.height,
    this.radius,
    Key? key,
  }) : super(key: key);

  const Image.s1(this.image, {Key? key})
      : width = up.Dimensions.image1,
        height = up.Dimensions.image1,
        radius = up.Dimensions.borderRadius1,
        super(key: key);

  const Image.w1(this.image, {Key? key})
      : width = up.Dimensions.image1,
        height = null,
        radius = up.Dimensions.borderRadius1,
        super(key: key);

  const Image.h1(this.image, {Key? key})
      : width = null,
        height = up.Dimensions.image1,
        radius = up.Dimensions.borderRadius1,
        super(key: key);

  const Image.s2(this.image, {Key? key})
      : width = up.Dimensions.image2,
        height = up.Dimensions.image2,
        radius = up.Dimensions.borderRadius2,
        super(key: key);

  const Image.w2(this.image, {Key? key})
      : width = up.Dimensions.image2,
        height = double.infinity,
        radius = up.Dimensions.borderRadius2,
        super(key: key);

  const Image.h2(this.image, {Key? key})
      : width = double.infinity,
        height = up.Dimensions.image2,
        radius = up.Dimensions.borderRadius2,
        super(key: key);

  const Image.s3(this.image, {Key? key})
      : width = up.Dimensions.image3,
        height = up.Dimensions.image3,
        radius = up.Dimensions.borderRadius3,
        super(key: key);

  const Image.w3(this.image, {Key? key})
      : width = up.Dimensions.image3,
        height = double.infinity,
        radius = up.Dimensions.borderRadius3,
        super(key: key);

  const Image.h3(this.image, {Key? key})
      : width = double.infinity,
        height = up.Dimensions.image3,
        radius = up.Dimensions.borderRadius3,
        super(key: key);

  const Image.s4(this.image, {Key? key})
      : width = up.Dimensions.icon1,
        height = up.Dimensions.icon1,
        radius = up.Dimensions.borderRadius4,
        super(key: key);

  const Image.w4(this.image, {Key? key})
      : width = up.Dimensions.image1,
        height = double.infinity,
        radius = up.Dimensions.borderRadius3,
        super(key: key);

  const Image.h4(this.image, {Key? key})
      : width = double.infinity,
        height = up.Dimensions.image1,
        radius = up.Dimensions.borderRadius3,
        super(key: key);

  final ImageProvider<Object> image;
  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return flutter.Image(
      fit: BoxFit.cover,
      image: image,
      width: width,
      height: height,
      frameBuilder: (context, child, _, __) => radius != null
          ? Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius!),
                child: child,
              ),
            )
          : child,
    );
  }
}
