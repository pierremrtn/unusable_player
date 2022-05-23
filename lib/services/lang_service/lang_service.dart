import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'jp_jp.dart';
import 'en_us.dart';

const String _kLocalKey = "locale";

class LangService extends GetxService with Translations {
  static LangService get instance => Get.find<LangService>();

  static const Locale fallbackLocale = Locale("en_US");

  late final Box<String> _cache;

  Future<LangService> init() async {
    _cache = await Hive.openBox('language_mode');
    return this;
  }

  Locale? get initialLocale {
    final String? language = _cache.get(_kLocalKey);
    if (language != null) {
      return Locale(language);
    } else {
      return Get.deviceLocale;
    }
  }

  Future<void> switchTo(Locale locale) async {
    _cache.put(_kLocalKey, locale.languageCode);
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'jp_JP': jpJP,
      };
}
