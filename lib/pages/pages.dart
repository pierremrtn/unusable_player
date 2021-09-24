import 'package:get/get.dart';
import 'package:unusable_player/pages/ui_kit/ui_kit.dart';
import 'package:unusable_player/pages/home/home.dart';

part 'routes.dart';

class Pages {
  static const String initial = Routes.home;

  static List<GetPage> pages = [
    GetPage(
      name: Routes.UIKit,
      page: () => UIKit(),
    ),
    GetPage(
      name: Routes.home,
      page: () => Home(),
    )
  ];
}
