import 'package:get/get.dart';
import 'package:unusable_player/pages/ui_kit/ui_kit_page.dart';
import 'package:unusable_player/pages/home/home_page.dart';
import 'package:unusable_player/pages/player/player_page.dart';
import 'package:unusable_player/unusable_player.dart' as up;

export 'player/models/player_parameters.dart';

part 'routes.dart';

class Pages {
  static const String initial = Routes.home;

  static List<GetPage> pages = [
    GetPage(
      name: Routes.UIKit,
      page: () => const UIKitPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.player,
      page: () => const PlayerPage(),
      binding: PlayerBindings(),
      transition: Transition.rightToLeft,
      curve: up.Feel.animationCurve,
      transitionDuration: up.Feel.animationDuration,
    ),
  ];
}
