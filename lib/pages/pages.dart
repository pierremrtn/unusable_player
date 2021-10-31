import 'package:get/get.dart';
import 'package:unusable_player/pages/ui_kit/ui_kit.dart';
import 'package:unusable_player/pages/home/home.dart';
import 'package:unusable_player/pages/player/player.dart';

part 'routes.dart';

class Pages {
  static const String initial = Routes.home;

  static List<GetPage> pages = [
    GetPage(
      name: Routes.UIKit,
      page: () => const UIKit(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const Home(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.player,
      page: () => const Player(),
      binding: PlayerBindings(),
      transition: Transition.rightToLeft,
    ),
  ];
}
