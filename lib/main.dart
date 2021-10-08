import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unusable_player/pages/pages.dart';
import 'package:unusable_player/services/audio_query_service.dart';
import 'package:unusable_player/theme/theme_data/theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(UnusablePlayer());
}

class UnusablePlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      initialRoute: Pages.initial,
      getPages: Pages.pages,
    );
  }
}

Future<void> initServices() async {
  await Get.putAsync(() => AudioQueryService().init());
}
