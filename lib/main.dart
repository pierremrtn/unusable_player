import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      theme: up.lightTheme,
      initialRoute: up.Pages.initial,
      getPages: up.Pages.pages,
    );
  }
}

Future<void> initServices() async {
  await Get.putAsync(() => up.AudioQueryService().init());
}
