import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:palette_generator/palette_generator.dart';

class ColorService extends GetxService {
  static ColorService get instance => Get.find<ColorService>();

  static const List<Color> _colors = [
    Color(0xffE09A49),
    Color(0xffF9E79A),
    Color(0xff82B594),
    Color(0xff8366B4),
    Color(0xffBCD4CA),
    Color(0xffF7DEB2),
  ];

  final Random _random = Random();
  Future<Color> dominantColor(ImageProvider image) async {
    final palette = await PaletteGenerator.fromImageProvider(image);
    return palette.lightMutedColor?.color ?? Colors.white;
  }

  Color nextColor() => _colors[_random.nextInt(_colors.length)];
}
