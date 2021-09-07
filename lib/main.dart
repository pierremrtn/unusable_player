import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unusable_player/pages/pages.dart';
import 'package:unusable_player/theme/theme_data/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      initialRoute: Pages.initial,
      getPages: Pages.pages,
    );
  }
}
