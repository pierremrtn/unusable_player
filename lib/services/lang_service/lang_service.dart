import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unusable_player/services/lang_service/en_us.dart';
import 'package:unusable_player/services/lang_service/fr_FR.dart';

class LangService extends GetxService with Translations {
  static LangService get instance => Get.find<LangService>();

  static const Locale fallbackLocale = Locale("en_US");
  static Locale? get initialLocale => Get.deviceLocale;

  Future<LangService> init() async {
    return this;
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        // 'fr_FR': frFR,
      };
}
