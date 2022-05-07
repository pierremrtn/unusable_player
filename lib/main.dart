import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:unusable_player/unusable_player.dart' as up;

Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const UnusablePlayer());
}

class UnusablePlayer extends StatelessWidget {
  const UnusablePlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: up.ThemeService.instance.themeMode,
      theme: up.lightTheme,
      darkTheme: up.darkTheme,
      initialRoute: up.Pages.initial,
      getPages: up.Pages.pages,
      translations: up.LangService(),
      locale: up.LangService.initialLocale,
      fallbackLocale: up.LangService.fallbackLocale,
    );
  }
}

Future<void> initServices() async {
  Get.lazyPut(() => up.AudioPlayerService());
  Get.lazyPut(() => up.ColorService());
  Get.lazyPut(() => up.CacheService());
  await Future.wait([
    Get.putAsync(() => up.AudioQueryService(
          cacheService: up.CacheService.instance,
          colorService: up.ColorService.instance,
        ).init()),
    Get.putAsync(() => up.LangService().init()),
    Get.putAsync(() => up.ThemeService().init()),
  ]);
}
