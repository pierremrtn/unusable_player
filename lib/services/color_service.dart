import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class ColorService extends GetxService {
  static ColorService get instance => Get.find<ColorService>();

  static const List<Color> _colors = [
    up.Colors.opal,
    up.Colors.darkSeaGreen,
    up.Colors.dutchWhite,
    up.Colors.greenYellowCrayola,
    up.Colors.darkBlueGray,
  ];

  final Random _random = Random();
  Future<Color> dominantColor(ImageProvider image) async {
    final palette = await PaletteGenerator.fromImageProvider(image);
    return palette.lightMutedColor?.color ?? Colors.white;
  }

  Color nextColor() => _colors[_random.nextInt(_colors.length)];
}
