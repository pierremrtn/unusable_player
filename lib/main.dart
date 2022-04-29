import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unusable_player/theme/theme_data/colors_scheme.dart';

import 'package:unusable_player/unusable_player.dart' as up;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const UnusablePlayer());
}

class UnusablePlayer extends StatelessWidget {
  const UnusablePlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: up.lightTheme,
      theme: up.darkTheme,
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
  ]);
}
